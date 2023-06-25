{{/* Define the tlsOptions */}}
{{- define "traefik.tlsOptions" -}}
{{- $namespace := ( printf "ix-%s" .Release.Name ) }}
{{- if or ( not .Values.ingressClass.enabled ) ( and ( .Values.ingressClass.enabled ) ( .Values.ingressClass.isDefaultClass ) ) }}
{{- $namespace = "default" }}
{{- end }}
{{- range $name, $config := .Values.tlsOptions }}
---
apiVersion: traefik.containo.us/v1alpha1
kind: TLSOption
metadata:
  name: {{ $name }}
  namespace: {{ $namespace }}
spec:
  {{- toYaml $config | nindent 2 }}
{{- end }}
{{- end -}}
