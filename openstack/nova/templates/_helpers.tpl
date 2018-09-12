{{- define "conductor_name" -}}
{{- if . -}}
{{ printf "nova-cell-%s-conductor" .name | trunc 63 }}
{{- else -}}
  nova-conductor
{{- end -}}
{{- end -}}

{{- define "postgres_name" -}}
{{- if . -}}
{{ printf "nova-cell-%s-postgresql" .name | trunc 63 }}
{{- else -}}
  nova-postgres
{{- end -}}
{{- end -}}

{{- define "rabbitmq_name" -}}
{{- if . -}}
{{ printf "nova-cell-%s-rabbitmq" .name | trunc 63 }}
{{- else -}}
  nova-rabbitmq
{{- end -}}
{{- end -}}

{{- define "cell_db_url" -}}
{{- $cell := index . 1 -}}
{{- $user := index . 2 -}}
{{- $password := index . 3 -}}
{{- with index . 0 -}}
{{- $postgres_host := printf "%s.%s.svc.kubernetes.%s.%s" ( include "postgres_name" $cell ) .Release.Namespace .Values.global.region .Values.global.tld -}}
postgresql+psycopg2://{{$user}}:{{$password | urlquery}}@{{ $postgres_host }}
{{- end -}}
{{- end -}}

{{- define "cell_rabbit_url" -}}
{{- $cell := index . 1 -}}
{{- $user := index . 2 -}}
{{- $password := index . 3 -}}
{{- $port := index . 4 -}}
{{- $virtual_host := index . 5 -}}
{{- with index . 0 -}}
{{- $rabbitmq_host := printf "%s.%s.svc.kubernetes.%s.%s" ( include "rabbitmq_name" $cell ) .Release.Namespace .Values.global.region .Values.global.tld -}}
rabbit://{{$user}}:{{$password | urlquery}}@{{$rabbitmq_host}}:{{$port}}{{$virtual_host}}
{{- end -}}
{{- end -}}

{{- define "nova_cell_conf" -}}
{{- $cell := index . 1 -}}
{{- with index . 0 -}}
[DEFAULT]
# use cell specific rabbitmq
transport_url = {{ tuple . $cell .Values.rabbitmq.users.default.user ( .Values.rabbitmq.users.default.password | default (tuple . .Values.rabbitmq.users.default.user | include "rabbitmq.password_for_user")) (.Values.rabbitmq.port | default 5672) (.Values.rabbitmq.virtual_host | default "/") | include "cell_rabbit_url" }}

[database]
connection = {{ tuple . $cell .Values.postgresql.user .Values.postgresql.postgresPassword | include "cell_db_url" }}
{{- end -}}
{{- end -}}
