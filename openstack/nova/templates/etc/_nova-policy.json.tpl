{
    "context_is_cloud_admin":  "role:cloud_compute_admin",
    "context_is_admin":  "rule:context_is_cloud_admin",
    "owner": "project_id:%(project_id)s",
    "member": "role:member and rule:owner",
    "viewer": "role:compute_viewer and rule:owner",
    "admin": "role:compute_admin and rule:owner",
    "context_is_compute_admin": "rule:context_is_admin or rule:admin",
    "context_is_editor": "rule:context_is_compute_admin or rule:member",
    "context_is_viewer":  "rule:context_is_editor or rule:viewer",
    "compute_admin_all": "role:compute_admin or role:cloud_compute_admin",
    "default": "rule:context_is_admin",

    "network_admin": "role:network_admin and rule:owner",
    "context_is_network_admin": "role:cloud_network_admin or rule:network_admin",

    "cells_scheduler_filter:TargetCellFilter": "rule:context_is_admin",

    "compute:create": "rule:context_is_editor",
    "compute:create:attach_network": "rule:context_is_editor",
    "compute:create:attach_volume": "rule:context_is_editor",
    "compute:create:forced_host": "rule:compute_admin_all",

    "compute:get": "rule:context_is_viewer",
    "compute:get_all": "rule:context_is_viewer",
    "compute:get_all_tenants": "rule:context_is_admin",

    "compute:update": "rule:context_is_editor",

    "compute:get_instance_metadata": "rule:context_is_viewer",
    "compute:get_all_instance_metadata": "rule:context_is_viewer",
    "compute:get_all_instance_system_metadata": "rule:context_is_viewer",
    "compute:update_instance_metadata": "rule:context_is_editor",
    "compute:delete_instance_metadata": "rule:context_is_editor",

    "compute:get_diagnostics": "rule:context_is_admin",
    "compute:get_instance_diagnostics": "rule:context_is_admin",

    "compute:start": "rule:context_is_editor",
    "compute:stop": "rule:context_is_editor",

    "compute:lock": "rule:context_is_compute_admin",
    "compute:unlock": "rule:context_is_compute_admin",
    "compute:unlock_override": "rule:context_is_admin",

    "compute:get_vnc_console": "rule:context_is_editor",
    "compute:get_spice_console": "rule:context_is_editor",
    "compute:get_rdp_console": "rule:context_is_editor",
    "compute:get_serial_console": "rule:context_is_editor",
    "compute:get_mks_console": "rule:context_is_editor",
    "compute:get_console_output": "rule:context_is_editor",

    "compute:reset_network": "rule:context_is_editor",
    "compute:inject_network_info": "rule:context_is_editor",
    "compute:add_fixed_ip": "rule:context_is_editor",
    "compute:remove_fixed_ip": "rule:context_is_editor",

    "compute:attach_volume": "rule:context_is_editor",
    "compute:detach_volume": "rule:context_is_editor",
    "compute:swap_volume": "rule:context_is_editor",

    "compute:attach_interface": "rule:context_is_editor",
    "compute:detach_interface": "rule:context_is_editor",

    "compute:set_admin_password": "rule:context_is_editor",

    "compute:rescue": "rule:context_is_editor",
    "compute:unrescue": "rule:context_is_editor",

    "compute:suspend": "rule:context_is_editor",
    "compute:resume": "rule:context_is_editor",

    "compute:pause": "rule:context_is_editor",
    "compute:unpause": "rule:context_is_editor",

    "compute:shelve": "rule:context_is_editor",
    "compute:shelve_offload": "rule:context_is_editor",
    "compute:unshelve": "rule:context_is_editor",

    "compute:snapshot": "rule:context_is_editor",
    "compute:snapshot_volume_backed": "rule:context_is_editor",
    "compute:backup": "rule:context_is_editor",

    "compute:resize": "rule:context_is_editor",
    "compute:confirm_resize": "rule:context_is_editor",
    "compute:revert_resize": "rule:context_is_editor",

    "compute:rebuild": "rule:context_is_editor",
    "compute:reboot": "rule:context_is_editor",
    "compute:delete": "rule:context_is_editor",
    "compute:soft_delete": "rule:context_is_editor",
    "compute:force_delete": "rule:context_is_editor",

    "compute:security_groups:add_to_instance": "rule:context_is_compute_admin or rule:context_is_network_admin",
    "compute:security_groups:remove_from_instance": "rule:context_is_compute_admin or rule:context_is_network_admin",

    "compute:restore": "rule:context_is_editor",

    "compute:volume_snapshot_create": "rule:context_is_editor",
    "compute:volume_snapshot_delete": "rule:context_is_editor",

    "compute_extension:accounts": "rule:context_is_admin",
    "compute_extension:admin_actions": "rule:context_is_admin",
    "compute_extension:admin_actions:pause": "rule:context_is_editor",
    "compute_extension:admin_actions:unpause": "rule:context_is_editor",
    "compute_extension:admin_actions:suspend": "rule:context_is_editor",
    "compute_extension:admin_actions:resume": "rule:context_is_editor",
    "compute_extension:admin_actions:lock": "rule:context_is_compute_admin",
    "compute_extension:admin_actions:unlock": "rule:context_is_compute_admin",
    "compute_extension:admin_actions:resetNetwork": "rule:context_is_admin",
    "compute_extension:admin_actions:injectNetworkInfo": "rule:context_is_admin",
    "compute_extension:admin_actions:createBackup": "rule:context_is_editor",
    "compute_extension:admin_actions:migrateLive": "rule:context_is_admin",
    "compute_extension:admin_actions:resetState": "rule:context_is_compute_admin",
    "compute_extension:admin_actions:migrate": "rule:context_is_admin",
    "compute_extension:aggregates": "rule:context_is_admin",
    "compute_extension:agents": "rule:context_is_admin",
    "compute_extension:attach_interfaces": "rule:context_is_editor",
    "compute_extension:baremetal_nodes": "rule:context_is_admin",
    "compute_extension:cells": "rule:context_is_admin",
    "compute_extension:cells:create": "rule:context_is_admin",
    "compute_extension:cells:delete": "rule:context_is_admin",
    "compute_extension:cells:update": "rule:context_is_admin",
    "compute_extension:cells:sync_instances": "rule:context_is_admin",
    "compute_extension:certificates": "rule:context_is_editor",
    "compute_extension:cloudpipe": "rule:context_is_admin",
    "compute_extension:cloudpipe_update": "rule:context_is_admin",
    "compute_extension:config_drive": "rule:context_is_editor",
    "compute_extension:console_output": "rule:context_is_editor",
    "compute_extension:consoles": "rule:context_is_editor",
    "compute_extension:createserverext": "rule:context_is_editor",
    "compute_extension:deferred_delete": "rule:context_is_editor",
    "compute_extension:disk_config": "rule:context_is_editor",
    "compute_extension:evacuate": "rule:context_is_admin",
    "compute_extension:extended_server_attributes": "rule:context_is_editor",
    "compute_extension:extended_status": "rule:context_is_viewer",
    "compute_extension:extended_availability_zone": "rule:context_is_viewer",
    "compute_extension:extended_ips": "rule:context_is_viewer",
    "compute_extension:extended_ips_mac": "rule:context_is_viewer",
    "compute_extension:extended_vif_net": "rule:context_is_viewer",
    "compute_extension:extended_volumes": "rule:context_is_viewer",
    "compute_extension:fixed_ips": "rule:context_is_admin",
    "compute_extension:flavor_access": "rule:context_is_editor",
    "compute_extension:flavor_access:addTenantAccess": "rule:context_is_admin",
    "compute_extension:flavor_access:removeTenantAccess": "rule:context_is_admin",
    "compute_extension:flavor_disabled": "rule:context_is_editor",
    "compute_extension:flavor_rxtx": "rule:context_is_editor",
    "compute_extension:flavor_swap": "rule:context_is_editor",
    "compute_extension:flavorextradata": "rule:context_is_editor",
    "compute_extension:flavorextraspecs:index": "rule:context_is_editor",
    "compute_extension:flavorextraspecs:show": "rule:context_is_editor",
    "compute_extension:flavorextraspecs:create": "rule:context_is_admin",
    "compute_extension:flavorextraspecs:update": "rule:context_is_admin",
    "compute_extension:flavorextraspecs:delete": "rule:context_is_admin",
    "compute_extension:flavormanage": "rule:context_is_admin",
    "compute_extension:floating_ip_dns": "rule:context_is_editor",
    "compute_extension:floating_ip_pools": "rule:context_is_editor",
    "compute_extension:floating_ips": "rule:context_is_editor",
    "compute_extension:floating_ips_bulk": "rule:context_is_admin",
    "compute_extension:fping": "rule:context_is_editor",
    "compute_extension:fping:all_tenants": "rule:context_is_admin",
    "compute_extension:hide_server_addresses": "not rule:context_is_admin",
    "compute_extension:hosts": "rule:context_is_admin",
    "compute_extension:hypervisors": "rule:context_is_admin",
    "compute_extension:image_size": "rule:context_is_editor",
    "compute_extension:instance_actions": "rule:context_is_editor",
    "compute_extension:instance_actions:events": "rule:context_is_admin",
    "compute_extension:instance_usage_audit_log": "rule:context_is_admin",
    "compute_extension:keypairs": "rule:context_is_editor",
    "compute_extension:keypairs:index": "rule:context_is_viewer",
    "compute_extension:keypairs:show": "rule:context_is_viewer",
    "compute_extension:keypairs:create": "rule:context_is_editor",
    "compute_extension:keypairs:delete": "rule:context_is_editor",
    "compute_extension:multinic": "rule:context_is_editor",
    "compute_extension:networks": "!",
    "compute_extension:networks:view": "!",
    "compute_extension:networks_associate": "!",
    "compute_extension:os-tenant-networks": "!",
    "compute_extension:quotas:show": "rule:context_is_viewer",
    "compute_extension:quotas:update": "rule:context_is_admin",
    "compute_extension:quotas:delete": "rule:context_is_admin",
    "compute_extension:quota_classes": "rule:context_is_admin",
    "compute_extension:rescue": "rule:context_is_editor",
    "compute_extension:security_group_default_rules": "rule:context_is_admin",
    "compute_extension:security_groups": "rule:context_is_viewer",
    "compute_extension:server_diagnostics": "rule:context_is_admin",
    "compute_extension:server_groups": "rule:context_is_editor",
    "compute_extension:server_password": "rule:context_is_editor",
    "compute_extension:server_usage": "rule:context_is_editor",
    "compute_extension:services": "rule:context_is_admin",
    "compute_extension:shelve": "rule:context_is_editor",
    "compute_extension:shelveOffload": "rule:context_is_admin",
    "compute_extension:simple_tenant_usage:show": "rule:context_is_editor",
    "compute_extension:simple_tenant_usage:list": "rule:context_is_admin",
    "compute_extension:unshelve": "rule:context_is_editor",
    "compute_extension:users": "rule:context_is_admin",
    "compute_extension:virtual_interfaces": "rule:context_is_editor",
    "compute_extension:virtual_storage_arrays": "rule:context_is_editor",
    "compute_extension:volumes": "rule:context_is_viewer",
    "compute_extension:volume_attachments:index": "rule:context_is_viewer",
    "compute_extension:volume_attachments:show": "rule:context_is_viewer",
    "compute_extension:volume_attachments:create": "rule:context_is_editor",
    "compute_extension:volume_attachments:update": "rule:context_is_editor",
    "compute_extension:volume_attachments:delete": "rule:context_is_editor",
    "compute_extension:volumetypes": "rule:context_is_editor",
    "compute_extension:availability_zone:list": "rule:context_is_viewer",
    "compute_extension:availability_zone:detail": "rule:context_is_admin",
    "compute_extension:used_limits_for_admin": "rule:context_is_admin",
    "compute_extension:migrations:index": "rule:context_is_admin",
    "compute_extension:os-assisted-volume-snapshots:create": "rule:context_is_admin",
    "compute_extension:os-assisted-volume-snapshots:delete": "rule:context_is_admin",
    "compute_extension:console_auth_tokens": "rule:context_is_admin",
    "compute_extension:os-server-external-events:create": "rule:context_is_admin",

    "network:get_all": "rule:context_is_admin",
    "network:get": "rule:context_is_admin",
    "network:create": "rule:context_is_admin",
    "network:delete": "rule:context_is_admin",
    "network:associate": "rule:context_is_admin",
    "network:disassociate": "rule:context_is_admin",
    "network:get_vifs_by_instance": "rule:context_is_admin",
    "network:allocate_for_instance": "rule:context_is_admin",
    "network:deallocate_for_instance": "rule:context_is_admin",
    "network:validate_networks": "rule:context_is_admin",
    "network:get_instance_uuids_by_ip_filter": "rule:context_is_admin",
    "network:get_instance_id_by_floating_address": "rule:context_is_admin",
    "network:setup_networks_on_host": "rule:context_is_admin",
    "network:get_backdoor_port": "rule:context_is_admin",

    "network:get_floating_ip": "rule:context_is_viewer",
    "network:get_floating_ip_pools": "rule:context_is_viewer",
    "network:get_floating_ip_by_address": "rule:context_is_viewer",
    "network:get_floating_ips_by_project": "rule:context_is_viewer",
    "network:get_floating_ips_by_fixed_address": "rule:context_is_viewer",
    "network:allocate_floating_ip": "rule:context_is_admin",
    "network:associate_floating_ip": "rule:context_is_admin",
    "network:disassociate_floating_ip": "rule:context_is_admin",
    "network:release_floating_ip": "rule:context_is_admin",
    "network:migrate_instance_start": "rule:context_is_admin",
    "network:migrate_instance_finish": "rule:context_is_admin",

    "network:get_fixed_ip": "rule:context_is_admin",
    "network:get_fixed_ip_by_address": "rule:context_is_admin",
    "network:add_fixed_ip_to_instance": "rule:context_is_admin",
    "network:remove_fixed_ip_from_instance": "rule:context_is_admin",
    "network:add_network_to_project": "!",
    "network:get_instance_nw_info": "!",

    "network:get_dns_domains": "!",
    "network:add_dns_entry": "!",
    "network:modify_dns_entry": "!",
    "network:delete_dns_entry": "!",
    "network:get_dns_entries_by_address": "!",
    "network:get_dns_entries_by_name": "!",
    "network:create_private_dns_domain": "!",
    "network:create_public_dns_domain": "!",
    "network:delete_dns_domain": "!",
    "network:attach_external_network": "rule:context_is_admin",
    "network:get_vif_by_mac_address": "rule:context_is_admin",

    "os_compute_api:servers:detail:get_all_tenants": "rule:context_is_admin",
    "os_compute_api:servers:index:get_all_tenants": "rule:context_is_admin",
    "os_compute_api:servers:confirm_resize": "rule:context_is_editor",
    "os_compute_api:servers:create": "rule:context_is_editor",
    "os_compute_api:servers:create:attach_network": "rule:context_is_editor",
    "os_compute_api:servers:create:attach_volume": "rule:context_is_editor",
    "os_compute_api:servers:create:forced_host": "rule:compute_admin_all",
    "os_compute_api:servers:delete": "rule:context_is_editor",
    "os_compute_api:servers:update": "rule:context_is_editor",
    "os_compute_api:servers:detail": "rule:context_is_viewer",
    "os_compute_api:servers:index": "rule:context_is_viewer",
    "os_compute_api:servers:reboot": "rule:context_is_editor",
    "os_compute_api:servers:rebuild": "rule:context_is_editor",
    "os_compute_api:servers:resize": "rule:context_is_editor",
    "os_compute_api:servers:revert_resize": "rule:context_is_editor",
    "os_compute_api:servers:show": "rule:context_is_viewer",
    "os_compute_api:servers:show:host_status": "rule:context_is_admin",
    "os_compute_api:servers:create_image": "rule:context_is_editor",
    "os_compute_api:servers:create_image:allow_volume_backed": "rule:context_is_editor",
    "os_compute_api:servers:start": "rule:context_is_editor",
    "os_compute_api:servers:stop": "rule:context_is_editor",
    "os_compute_api:servers:trigger_crash_dump": "rule:context_is_editor",
    "os_compute_api:servers:migrations:force_complete": "rule:context_is_admin",
    "os_compute_api:servers:migrations:delete": "rule:context_is_admin",
    "os_compute_api:servers:discoverable": "@",
    "os_compute_api:servers:migrations:index": "rule:context_is_admin",
    "os_compute_api:servers:migrations:show": "rule:context_is_admin",
    "os_compute_api:os-access-ips:discoverable": "@",
    "os_compute_api:os-access-ips": "rule:context_is_editor",
    "os_compute_api:os-admin-actions": "rule:context_is_admin",
    "os_compute_api:os-admin-actions:discoverable": "@",
    "os_compute_api:os-admin-actions:reset_network": "rule:context_is_admin",
    "os_compute_api:os-admin-actions:inject_network_info": "rule:context_is_admin",
    "os_compute_api:os-admin-actions:reset_state": "rule:context_is_compute_admin",
    "os_compute_api:os-admin-password": "rule:context_is_editor",
    "os_compute_api:os-admin-password:discoverable": "@",
    "os_compute_api:os-aggregates:discoverable": "@",
    "os_compute_api:os-aggregates:index": "rule:context_is_admin",
    "os_compute_api:os-aggregates:create": "rule:context_is_admin",
    "os_compute_api:os-aggregates:show": "rule:context_is_admin",
    "os_compute_api:os-aggregates:update": "rule:context_is_admin",
    "os_compute_api:os-aggregates:delete": "rule:context_is_admin",
    "os_compute_api:os-aggregates:add_host": "rule:context_is_admin",
    "os_compute_api:os-aggregates:remove_host": "rule:context_is_admin",
    "os_compute_api:os-aggregates:set_metadata": "rule:context_is_admin",
    "os_compute_api:os-agents": "rule:context_is_admin",
    "os_compute_api:os-agents:discoverable": "@",
    "os_compute_api:os-attach-interfaces": "rule:context_is_editor",
    "os_compute_api:os-attach-interfaces:discoverable": "@",
    "os_compute_api:os-baremetal-nodes": "rule:context_is_admin",
    "os_compute_api:os-baremetal-nodes:discoverable": "@",
    "os_compute_api:os-block-device-mapping-v1:discoverable": "@",
    "os_compute_api:os-cells": "rule:context_is_admin",
    "os_compute_api:os-cells:create": "rule:context_is_admin",
    "os_compute_api:os-cells:delete": "rule:context_is_admin",
    "os_compute_api:os-cells:update": "rule:context_is_admin",
    "os_compute_api:os-cells:sync_instances": "rule:context_is_admin",
    "os_compute_api:os-cells:discoverable": "@",
    "os_compute_api:os-certificates:create": "rule:context_is_editor",
    "os_compute_api:os-certificates:show": "rule:context_is_viewer",
    "os_compute_api:os-certificates:discoverable": "@",
    "os_compute_api:os-cloudpipe": "rule:context_is_admin",
    "os_compute_api:os-cloudpipe:discoverable": "@",
    "os_compute_api:os-config-drive": "rule:context_is_editor",
    "os_compute_api:os-consoles:discoverable": "@",
    "os_compute_api:os-consoles:create": "rule:context_is_editor",
    "os_compute_api:os-consoles:delete": "rule:context_is_editor",
    "os_compute_api:os-consoles:index": "rule:context_is_editor",
    "os_compute_api:os-consoles:show": "rule:context_is_editor",
    "os_compute_api:os-console-output:discoverable": "@",
    "os_compute_api:os-console-output": "rule:context_is_editor",
    "os_compute_api:os-remote-consoles": "rule:context_is_editor",
    "os_compute_api:os-remote-consoles:discoverable": "@",
    "os_compute_api:os-create-backup:discoverable": "@",
    "os_compute_api:os-create-backup": "rule:context_is_editor",
    "os_compute_api:os-deferred-delete": "rule:context_is_editor",
    "os_compute_api:os-deferred-delete:discoverable": "@",
    "os_compute_api:os-disk-config": "rule:context_is_editor",
    "os_compute_api:os-disk-config:discoverable": "@",
    "os_compute_api:os-evacuate": "rule:context_is_admin",
    "os_compute_api:os-evacuate:discoverable": "@",
    "os_compute_api:os-extended-server-attributes": "rule:context_is_viewer",
    "os_compute_api:os-extended-server-attributes:discoverable": "@",
    "os_compute_api:os-extended-status": "rule:context_is_editor",
    "os_compute_api:os-extended-status:discoverable": "@",
    "os_compute_api:os-extended-availability-zone": "rule:context_is_viewer",
    "os_compute_api:os-extended-availability-zone:discoverable": "@",
    "os_compute_api:extensions": "rule:context_is_viewer",
    "os_compute_api:extensions:discoverable": "@",
    "os_compute_api:extension_info:discoverable": "@",
    "os_compute_api:os-extended-volumes": "rule:context_is_viewer",
    "os_compute_api:os-extended-volumes:discoverable": "@",
    "os_compute_api:os-fixed-ips": "rule:context_is_admin",
    "os_compute_api:os-fixed-ips:discoverable": "@",
    "os_compute_api:os-flavor-access": "rule:context_is_editor",
    "os_compute_api:os-flavor-access:discoverable": "@",
    "os_compute_api:os-flavor-access:remove_tenant_access": "rule:context_is_admin",
    "os_compute_api:os-flavor-access:add_tenant_access": "rule:context_is_admin",
    "os_compute_api:os-flavor-rxtx": "rule:context_is_editor",
    "os_compute_api:os-flavor-rxtx:discoverable": "@",
    "os_compute_api:flavors": "rule:context_is_editor",
    "os_compute_api:flavors:discoverable": "@",
    "os_compute_api:os-flavor-extra-specs:discoverable": "@",
    "os_compute_api:os-flavor-extra-specs:index": "rule:context_is_viewer",
    "os_compute_api:os-flavor-extra-specs:show": "rule:context_is_viewer",
    "os_compute_api:os-flavor-extra-specs:create": "rule:context_is_admin",
    "os_compute_api:os-flavor-extra-specs:update": "rule:context_is_admin",
    "os_compute_api:os-flavor-extra-specs:delete": "rule:context_is_admin",
    "os_compute_api:os-flavor-manage:discoverable": "@",
    "os_compute_api:os-flavor-manage": "rule:context_is_admin",
    "os_compute_api:os-floating-ip-dns": "rule:context_is_editor",
    "os_compute_api:os-floating-ip-dns:discoverable": "@",
    "os_compute_api:os-floating-ip-dns:domain:update": "rule:context_is_admin",
    "os_compute_api:os-floating-ip-dns:domain:delete": "rule:context_is_admin",
    "os_compute_api:os-floating-ip-pools": "rule:context_is_editor",
    "os_compute_api:os-floating-ip-pools:discoverable": "@",
    "os_compute_api:os-floating-ips": "rule:context_is_editor",
    "os_compute_api:os-floating-ips:discoverable": "@",
    "os_compute_api:os-floating-ips-bulk": "rule:context_is_admin",
    "os_compute_api:os-floating-ips-bulk:discoverable": "@",
    "os_compute_api:os-fping": "rule:context_is_editor",
    "os_compute_api:os-fping:discoverable": "@",
    "os_compute_api:os-fping:all_tenants": "rule:context_is_admin",
    "os_compute_api:os-hide-server-addresses": "not rule:context_is_admin",
    "os_compute_api:os-hide-server-addresses:discoverable": "@",
    "os_compute_api:os-hosts": "rule:context_is_admin",
    "os_compute_api:os-hosts:discoverable": "@",
    "os_compute_api:os-hypervisors": "rule:context_is_admin",
    "os_compute_api:os-hypervisors:discoverable": "@",
    "os_compute_api:images:discoverable": "@",
    "os_compute_api:image-size": "rule:context_is_editor",
    "os_compute_api:image-size:discoverable": "@",
    "os_compute_api:os-instance-actions": "rule:context_is_editor",
    "os_compute_api:os-instance-actions:discoverable": "@",
    "os_compute_api:os-instance-actions:events": "rule:context_is_admin",
    "os_compute_api:os-instance-usage-audit-log": "rule:context_is_admin",
    "os_compute_api:os-instance-usage-audit-log:discoverable": "@",
    "os_compute_api:ips:discoverable": "@",
    "os_compute_api:ips:index": "rule:context_is_viewer",
    "os_compute_api:ips:show": "rule:context_is_viewer",
    "os_compute_api:os-keypairs:discoverable": "@",
    "os_compute_api:os-keypairs": "rule:context_is_editor",
    "os_compute_api:os-keypairs:index": "rule:context_is_admin or user_id:%(user_id)s",
    "os_compute_api:os-keypairs:show": "rule:context_is_admin or user_id:%(user_id)s",
    "os_compute_api:os-keypairs:create": "rule:context_is_admin or user_id:%(user_id)s",
    "os_compute_api:os-keypairs:delete": "rule:context_is_admin or user_id:%(user_id)s",
    "os_compute_api:limits:discoverable": "@",
    "os_compute_api:limits": "rule:context_is_viewer",
    "os_compute_api:os-lock-server:discoverable": "@",
    "os_compute_api:os-lock-server:lock": "rule:context_is_compute_admin",
    "os_compute_api:os-lock-server:unlock": "rule:context_is_compute_admin",
    "os_compute_api:os-lock-server:unlock:unlock_override": "rule:context_is_admin",
    "os_compute_api:os-migrate-server:discoverable": "@",
    "os_compute_api:os-migrate-server:migrate": "rule:context_is_admin",
    "os_compute_api:os-migrate-server:migrate_live": "rule:context_is_admin",
    "os_compute_api:os-multinic": "rule:context_is_editor",
    "os_compute_api:os-multinic:discoverable": "@",
    "os_compute_api:os-networks": "!",
    "os_compute_api:os-networks:view": "!",
    "os_compute_api:os-networks:discoverable": "@",
    "os_compute_api:os-networks-associate": "!",
    "os_compute_api:os-networks-associate:discoverable": "@",
    "os_compute_api:os-pause-server:discoverable": "@",
    "os_compute_api:os-pause-server:pause": "rule:context_is_editor",
    "os_compute_api:os-pause-server:unpause": "rule:context_is_editor",
    "os_compute_api:os-pci:pci_servers": "rule:context_is_editor",
    "os_compute_api:os-pci:discoverable": "@",
    "os_compute_api:os-pci:index": "rule:context_is_admin",
    "os_compute_api:os-pci:detail": "rule:context_is_admin",
    "os_compute_api:os-pci:show": "rule:context_is_admin",
    "os_compute_api:os-personality:discoverable": "@",
    "os_compute_api:os-preserve-ephemeral-rebuild:discoverable": "@",
    "os_compute_api:os-quota-sets:discoverable": "@",
    "os_compute_api:os-quota-sets:show": "rule:context_is_viewer",
    "os_compute_api:os-quota-sets:defaults": "rule:context_is_viewer",
    "os_compute_api:os-quota-sets:update": "rule:context_is_admin",
    "os_compute_api:os-quota-sets:delete": "rule:context_is_admin",
    "os_compute_api:os-quota-sets:detail": "rule:context_is_viewer",
    "os_compute_api:os-quota-class-sets:update": "rule:context_is_admin",
    "os_compute_api:os-quota-class-sets:show": "rule:context_is_admin or quota_class:%(quota_class)s",
    "os_compute_api:os-quota-class-sets:discoverable": "@",
    "os_compute_api:os-rescue": "rule:context_is_editor",
    "os_compute_api:os-rescue:discoverable": "@",
    "os_compute_api:os-scheduler-hints:discoverable": "@",
    "os_compute_api:os-security-group-default-rules:discoverable": "@",
    "os_compute_api:os-security-group-default-rules": "rule:context_is_admin",
    "os_compute_api:os-security-groups": "rule:context_is_viewer",
    "os_compute_api:os-security-groups:discoverable": "@",
    "os_compute_api:os-server-diagnostics": "rule:context_is_admin",
    "os_compute_api:os-server-diagnostics:discoverable": "@",
    "os_compute_api:os-server-password": "rule:context_is_editor",
    "os_compute_api:os-server-password:discoverable": "@",
    "os_compute_api:os-server-usage": "rule:context_is_editor",
    "os_compute_api:os-server-usage:discoverable": "@",
    "os_compute_api:os-server-groups": "rule:context_is_editor",
    "os_compute_api:os-server-groups:discoverable": "@",
    "os_compute_api:os-services": "rule:context_is_admin",
    "os_compute_api:os-services:disable": "!",
    "os_compute_api:os-services:discoverable": "@",
    "os_compute_api:server-metadata:discoverable": "@",
    "os_compute_api:server-metadata:index": "rule:context_is_viewer",
    "os_compute_api:server-metadata:show": "rule:context_is_viewer",
    "os_compute_api:server-metadata:delete": "rule:context_is_editor",
    "os_compute_api:server-metadata:create": "rule:context_is_editor",
    "os_compute_api:server-metadata:update": "rule:context_is_editor",
    "os_compute_api:server-metadata:update_all": "rule:context_is_editor",
    "os_compute_api:os-shelve:shelve": "rule:context_is_editor",
    "os_compute_api:os-shelve:shelve:discoverable": "@",
    "os_compute_api:os-shelve:shelve_offload": "rule:context_is_admin",
    "os_compute_api:os-simple-tenant-usage:discoverable": "@",
    "os_compute_api:os-simple-tenant-usage:show": "rule:context_is_viewer",
    "os_compute_api:os-simple-tenant-usage:list": "rule:context_is_admin",
    "os_compute_api:os-suspend-server:discoverable": "@",
    "os_compute_api:os-suspend-server:suspend": "rule:context_is_editor",
    "os_compute_api:os-suspend-server:resume": "rule:context_is_editor",
    "os_compute_api:os-tenant-networks": "!",
    "os_compute_api:os-tenant-networks:discoverable": "@",
    "os_compute_api:os-shelve:unshelve": "rule:context_is_editor",
    "os_compute_api:os-user-data:discoverable": "@",
    "os_compute_api:os-virtual-interfaces": "rule:context_is_editor",
    "os_compute_api:os-virtual-interfaces:discoverable": "@",
    "os_compute_api:os-volumes": "rule:context_is_viewer",
    "os_compute_api:os-volumes:discoverable": "@",
    "os_compute_api:os-volumes-attachments:index": "rule:context_is_viewer",
    "os_compute_api:os-volumes-attachments:show": "rule:context_is_viewer",
    "os_compute_api:os-volumes-attachments:create": "rule:context_is_editor",
    "os_compute_api:os-volumes-attachments:update": "rule:context_is_editor",
    "os_compute_api:os-volumes-attachments:delete": "rule:context_is_editor",
    "os_compute_api:os-volumes-attachments:discoverable": "@",
    "os_compute_api:os-availability-zone:list": "rule:context_is_viewer",
    "os_compute_api:os-availability-zone:discoverable": "@",
    "os_compute_api:os-availability-zone:detail": "rule:context_is_admin",
    "os_compute_api:os-used-limits": "rule:context_is_admin",
    "os_compute_api:os-used-limits:discoverable": "@",
    "os_compute_api:os-migrations:index": "rule:context_is_admin",
    "os_compute_api:os-migrations:discoverable": "@",
    "os_compute_api:os-assisted-volume-snapshots:create": "rule:context_is_admin",
    "os_compute_api:os-assisted-volume-snapshots:delete": "rule:context_is_admin",
    "os_compute_api:os-assisted-volume-snapshots:discoverable": "@",
    "os_compute_api:os-console-auth-tokens": "rule:context_is_admin",
    "os_compute_api:os-server-external-events:create": "rule:context_is_admin"
}
