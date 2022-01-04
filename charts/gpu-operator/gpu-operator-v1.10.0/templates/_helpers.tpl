{{/* vim: set filetype=mustache: */}}

{{/*
Full component image name with tag
*/}}
{{- define "image.fullname" -}}
    {{- $component := . }}
    {{- if hasSuffix "driver" $component.image }}
        {{- if hasPrefix "@" $component.tag }}
            {{- $component.image -}}:{{- $component.tag -}}
        {{- else }}
            {{- $component.image -}}:{{- $component.tag -}}-{{- $component.operatingSystemMajorMinor -}}
        {{- end }}
    {{- else }}
        {{- $component.image -}}:{{- $component.tag | default "v1.10.0" -}}
    {{- end }}
{{- end }}