{{/* vim: set filetype=mustache: */}}

{{/*
Full component image name with tag
*/}}
{{- define "image.fullname" -}}
{{- $component := . }}
{{- if contains $component.image "/driver" }}
  {{/* append os version to the driver image tag */}}
  {{- if contains $component.tag "@" }}
    {{/* if image digest is specified use it directly */}}
    {{- $component.image -}}:{{- $component.tag -}}
  {{- else }}
    {{- $component.image -}}:{{- $component.tag -}}-{{- .Values.operatingSystemMajorMinor -}}
  {{- end }}
{{- else }}
    {{- $component.image -}}:{{- $component.tag | default "v1.10.0" -}}
{{- end }}
{{- end }}