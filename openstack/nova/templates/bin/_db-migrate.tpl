#!/usr/bin/env bash
set -e

psql `cat /etc/nova/nova.conf  | grep 'nova:' | grep postgresql | cut -d'=' -f2- | sed 's/\+psycopg2//' | sed 's/?.*//' | xargs` <<-EOT
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;
UPDATE services SET deleted=id, deleted_at=now() WHERE updated_at IS NULL OR updated_at < now() - interval '30 minutes';
UPDATE compute_nodes
  SET service_id=(
    SELECT id FROM services WHERE services.host=compute_nodes.host AND deleted=0 ORDER BY updated_at DESC LIMIT 1)
    WHERE deleted=0 AND service_id IS NULL;
UPDATE compute_nodes SET deleted_at=now(), deleted=id WHERE service_id IS NULL;
EOT

set -x

nova-manage --config-dir /etc/nova db sync
nova-manage --config-dir /etc/nova api_db sync
#nova-manage --config-dir /etc/nova db online_data_migrations

# Create Cell0 in the API database
nova-manage cell_v2 map_cell0
nova-manage db sync

{{range .Values.cells }}
{{- if .enabled }}
{{- $cell := . }}
{{- with $ }}
nova-manage cell_v2 create_cell --name nova-cell-{{$cell.name}} --transport-url {{ tuple . $cell .Values.rabbitmq.users.default.user ( .Values.rabbitmq.users.default.password | default (tuple . .Values.rabbitmq.users.default.user | include "rabbitmq.password_for_user")) (.Values.rabbitmq.port | default 5672) (.Values.rabbitmq.virtual_host | default "/") | include "cell_rabbit_url" }} --database-connection {{ tuple . $cell .Values.postgresql.user .Values.postgresql.postgresPassword | include "cell_db_url" }} --verbose
{{- end }}
{{- end }}
{{ end }}

nova-manage cell_v2 discover_hosts

