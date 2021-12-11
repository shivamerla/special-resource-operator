{{/* vim: set filetype=mustache: */}}

{{/*
Full component image name with tag
*/}}
{{- define "image.fullname" -}}
{{- $component := . }}
{{- if contains $component.image "nvcr.io/nvidia/driver" }}
  {{/* append os version to the driver image tag */}}
  {{- if contains $component.tag "@" }}
    {{/* if image digest is specified use it directly */}}
    {{- $component.image -}}:{{- $component.tag -}}
  {{- else }}
    {{- $component.image -}}:{{- $component.tag -}}-ubuntu20.04
  {{- end }}
{{- else }}
    {{- $component.image -}}:{{- $component.tag | default "v1.10.0" -}}
{{- end }}
{{- end }}