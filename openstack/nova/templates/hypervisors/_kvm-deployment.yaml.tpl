{{- define "kvm_deployment" }}
{{- $hypervisor := index . 1 }}
{{- with index . 0 }}
kind: Deployment
apiVersion: extensions/v1beta1
metadata:
  name: nova-compute-{{$hypervisor.name}}
  labels:
    system: openstack
    type: backend
    component: nova
spec:
  replicas: 1
  revisionHistoryLimit: {{ .Values.pod.lifecycle.upgrades.deployments.revision_history }}
  strategy:
    type: Recreate
  selector:
    matchLabels:
      name: nova-compute-{{$hypervisor.name}}
  template:
    metadata:
      labels:
{{ tuple . "nova" "compute" | include "helm-toolkit.snippets.kubernetes_metadata_labels" | indent 8 }}
        name: nova-compute-{{$hypervisor.name}}
        hypervisor: "kvm"
      annotations:
        {{- if le .Capabilities.KubeVersion.Minor "6" }}
        scheduler.alpha.kubernetes.io/tolerations: '[{"key":"species","value":"hypervisor"}]'
        {{- end }}
        configmap-etc-hash: {{ include (print .Template.BasePath "/etc-configmap.yaml") . | sha256sum }}
        configmap-ironic-etc-hash: {{ tuple . $hypervisor | include "kvm_configmap" | sha256sum }}
    spec:
      hostNetwork: true
      hostPID: true
      hostIPC: true
      nodeSelector:
        kubernetes.io/hostname: {{$hypervisor.node_name}}
      {{- if ge .Capabilities.KubeVersion.Minor "7" }}
      tolerations:
      - key: "species"
        operator: "Equal"
        value: "hypervisor"
        effect: "NoSchedule"
      {{- end }}
      initContainers:
        - name: fix-permssion-instance-volume
          image: busybox
          command: ["sh", "-c", "chown -R 42436:42436 /var/lib/nova"]
          volumeMounts:
            - mountPath: /var/lib/nova/instances
              name: instances
      containers:
        - name: nova-compute
          image: {{ tuple . "compute" | include "container_image_nova" }}
          imagePullPolicy: IfNotPresent
          securityContext:
            privileged: true
          command:
            - kubernetes-entrypoint
          env:
            - name: COMMAND
              value: "nova-compute"
            - name: NAMESPACE
              value: {{ .Release.Namespace }}
            - name: SENTRY_DSN
              value: {{.Values.sentry_dsn | quote}}
{{- if or $hypervisor.python_warnings .Values.python_warnings }}
            - name: PYTHONWARNINGS
              value: {{ or $hypervisor.python_warnings .Values.python_warnings | quote }}
{{- end }}
          volumeMounts:
            - mountPath: /var/lib/nova/instances
              name: instances
            - mountPath: /var/lib/libvirt
              name: libvirt
            - mountPath: /lib/modules
              name: modules
              readOnly: true
            - mountPath: /var/run
              name: run
            - mountPath: /etc/nova
              name: etcnova
            - mountPath: /etc/nova/nova.conf
              name: nova-etc
              subPath: nova.conf
              readOnly: true
            - mountPath: /etc/nova/policy.json
              name: nova-etc
              subPath: policy.json
              readOnly: true
            - mountPath: /etc/nova/logging.ini
              name: nova-etc
              subPath: logging.ini
              readOnly: true
            - mountPath: /etc/nova/nova-compute.conf
              name: hypervisor-config
              subPath: nova-compute.conf
              readOnly: true
            - mountPath: /nova-patches
              name: nova-patches
            - mountPath: /etc/nova/rootwrap.conf
              name: nova-etc
              subPath: rootwrap.conf
              readOnly: true
        - name: nova-libvirt
          image: {{ tuple . "libvirt" | include "container_image_nova" }}
          imagePullPolicy: IfNotPresent
          securityContext:
            privileged: true
          command:
            - kubernetes-entrypoint
          env:
            - name: COMMAND
              value: /container.init/nova-libvirt-start
            - name: NAMESPACE
              value: {{ .Release.Namespace }}
            - name: SENTRY_DSN
              value: {{.Values.sentry_dsn | quote}}
          volumeMounts:
            - mountPath: /var/lib/nova/instances
              name: instances
            - mountPath: /var/lib/libvirt
              name: libvirt
            - mountPath: /var/run
              name: run
            - mountPath: /lib/modules
              name: modules
              readOnly: true
            - mountPath: /etc/nova
              name: etcnova
            - mountPath: /etc/nova/nova.conf
              name: nova-etc
              subPath: nova.conf
              readOnly: true
            - mountPath: /etc/nova/policy.json
              name: nova-etc
              subPath: policy.json
              readOnly: true
            - mountPath: /etc/nova/logging.ini
              name: nova-etc
              subPath: logging.ini
              readOnly: true
            - mountPath: /etc/libvirt
              name: etclibvirt
            - mountPath: /etc/libvirt/libvirtd.conf
              name: hypervisor-config
              subPath: libvirtd.conf
              readOnly: true
            - mountPath: /container.init
              name: nova-container-init
        - name: nova-virtlog
          image: {{ tuple . "libvirt" | include "container_image_nova" }}
          imagePullPolicy: IfNotPresent
          securityContext:
            privileged: true
          command:
            - kubernetes-entrypoint
          env:
            - name: COMMAND
              value: /usr/sbin/virtlogd
            - name: NAMESPACE
              value: {{ .Release.Namespace }}
            - name: SENTRY_DSN
              value: {{ .Values.sentry_dsn | quote }}
          volumeMounts:
            - mountPath: /var/lib/nova/instances
              name: instances
            - mountPath: /var/lib/libvirt
              name: libvirt
            - mountPath: /var/run
              name: run
            - mountPath: /lib/modules
              name: modules
              readOnly: true
            - mountPath: /etc/nova
              name: etcnova
            - mountPath: /etc/nova/nova.conf
              name: nova-etc
              subPath: nova.conf
              readOnly: true
            - mountPath: /etc/nova/policy.json
              name: nova-etc
              subPath: policy.json
              readOnly: true
            - mountPath: /etc/nova/logging.ini
              name: nova-etc
              subPath: logging.ini
              readOnly: true
            - mountPath: /etc/libvirt
              name: etclibvirt
            - mountPath: /etc/libvirt/libvirtd.conf
              name: hypervisor-config
              subPath: libvirtd.conf
              readOnly: true
            - mountPath: /container.init
              name: nova-container-init
        - name: neutron-ovs-agent
          image: {{ tuple . "openvswitch-agent" | include "container_image_neutron" }}
          imagePullPolicy: IfNotPresent
          securityContext:
            privileged: true
          command:
            - /container.init/neutron-ovs-agent-start
          volumeMounts:
            - mountPath: /var/run/
              name: run
            - mountPath: /lib/modules
              name: modules
              readOnly: true
            - mountPath: /neutron-etc
              name: neutron-etc
            - mountPath: /container.init
              name: neutron-container-init
        - name: ovs
          image: {{ tuple . "openvswitch-vswitchd" | include "container_image_neutron" }}
          imagePullPolicy: IfNotPresent
          securityContext:
            privileged: true
          command:
            - /container.init/neutron-ovs-start
          volumeMounts:
            - mountPath: /var/run/
              name: run
            - mountPath: /lib/modules
              name: modules
              readOnly: true
            - mountPath: /container.init
              name: neutron-container-init
        - name: ovs-db
          image: {{ tuple . "openvswitch-db-server" | include "container_image_neutron" }}
          imagePullPolicy: IfNotPresent
          securityContext:
            privileged: true
          command:
            - /container.init/neutron-ovs-db-start
          volumeMounts:
            - mountPath: /var/run/
              name: run
            - mountPath: /lib/modules
              name: modules
            - mountPath: /container.init
              name: neutron-container-init
      volumes:
        - name: instances
          persistentVolumeClaim:
            claimName: kvm-shared1-pvclaim
        - name: libvirt
          emptyDir:
            medium: Memory
        - name: run
          emptyDir:
            medium: Memory
        - name: modules
          hostPath:
            path: /lib/modules
        - name: cgroup
          hostPath:
            path: /sys/fs/cgroup
        - name: hypervisor-config
          configMap:
            name: hypervisor-{{ $hypervisor.name }}
        - name: etclibvirt
          emptyDir: {}
        - name: etcnova
          emptyDir: {}
        - name: nova-etc
          configMap:
            name: nova-etc
        - name: nova-patches
          configMap:
            name: nova-patches
        - name: neutron-etc
          configMap:
            name: neutron-etc
        - name: nova-container-init
          configMap:
            name: nova-bin
            defaultMode: 0755
        - name: neutron-container-init
          configMap:
            name: neutron-bin
            defaultMode: 0755
{{- end }}
{{- end }}
