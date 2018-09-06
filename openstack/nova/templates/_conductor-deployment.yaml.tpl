{{- define "nova-conductor" -}}
{{- $cell := index . 1 -}}
{{- with index . 0 -}}
kind: Deployment
apiVersion: extensions/v1beta1

metadata:
  name: {{ template "conductor_name" $cell }}
  labels:
    system: openstack
    type: backend
    component: nova
spec:
  replicas: {{ .Values.pod.replicas.conductor }}
  revisionHistoryLimit: {{ .Values.pod.lifecycle.upgrades.deployments.revision_history }}
  strategy:
    type: {{ .Values.pod.lifecycle.upgrades.deployments.podReplacementStrategy }}
    {{ if eq .Values.pod.lifecycle.upgrades.deployments.podReplacementStrategy "RollingUpdate" }}
    rollingUpdate:
      maxUnavailable: {{ .Values.pod.lifecycle.upgrades.deployments.rollingUpdate.maxUnavailable }}
      maxSurge: {{ .Values.pod.lifecycle.upgrades.deployments.rollingUpdate.maxSurge }}
    {{ end }}
  selector:
    matchLabels:
      name: {{ template "conductor_name" $cell }}
  template:
    metadata:
      labels:
        name: {{ template "conductor_name" $cell }}
{{ tuple . "nova" "conductor" | include "helm-toolkit.snippets.kubernetes_metadata_labels" | indent 8 }}
      annotations:
        pod.beta.kubernetes.io/hostname: {{ template "conductor_name" $cell }}
        configmap-etc-hash: {{ include (print .Template.BasePath "/etc-configmap.yaml") . | sha256sum }}
{{- if and (eq .Capabilities.KubeVersion.Major "1") (lt .Capabilities.KubeVersion.Minor "5") }}
        scheduler.alpha.kubernetes.io/affinity: >
            {{ tuple . "nova" "conductor" | include "kubernetes_pod_anti_affinity" }}
{{- end }}
    spec:
{{- if and (eq .Capabilities.KubeVersion.Major "1") (ge .Capabilities.KubeVersion.Minor "7") }}
{{ tuple . "nova" "conductor" | include "kubernetes_pod_anti_affinity" | indent 6 }}
{{- end }}
      hostname: {{ template "conductor_name" $cell }}
      containers:
        - name: nova-conductor
          image: {{.Values.global.imageRegistry}}/{{.Values.global.image_namespace}}/ubuntu-source-nova-conductor:{{.Values.imageVersionNovaConductor | default .Values.imageVersion | required "Please set nova.imageVersion or similar"}}
          imagePullPolicy: IfNotPresent
          command:
            - dumb-init
            - kubernetes-entrypoint
          env:
            - name: COMMAND
              value: "nova-conductor --config-file=/etc/nova/nova.conf{{ if $cell }} --config-file=/etc/nova/nova-cell-{{ $cell.name }}.conf{{ end }}"
            - name: NAMESPACE
              value: {{ .Release.Namespace }}
            - name: DEPENDENCY_SERVICE
              value: "{{ template "postgres_name" $cell }},{{ template "rabbitmq_name" $cell }}"
{{- if .Values.python_warnings}}
            - name: PYTHONWARNINGS
              value: {{ .Values.python_warnings | quote }}
{{- end }}
            - name: PGAPPNAME
              valueFrom:
                fieldRef:
                  fieldPath: metadata.name
          volumeMounts:
            - name: etcnova
              mountPath: /etc/nova
            - name: nova-etc
              mountPath: /etc/nova/nova.conf
              subPath: nova.conf
              readOnly: true
            - name: nova-etc
              mountPath: /etc/nova/logging.ini
              subPath: logging.ini
{{- if $cell }}
            - name: nova-etc
              mountPath: /etc/nova/nova-cell-{{ $cell.name }}.conf
              subPath: nova-cell-{{ $cell.name }}.conf
              readOnly: true
{{- end }}
      volumes:
        - name: etcnova
          emptyDir: {}
        - name: nova-etc
          configMap:
            name: nova-etc
{{- end -}}
{{- end -}}
