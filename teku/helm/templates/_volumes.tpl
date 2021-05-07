{{- define "teku.volumes" }}
{{- $uniqueVolumes := fromYaml (include "unique.volumes" . ) }}
{{- range $volumePath, $volumeName := $uniqueVolumes }}
- name: {{ $volumeName }}
{{- if eq $.persistentVolumeType "nfs" }}
  nfs:
    path: {{ $volumePath }}
    server: {{ $.nfs.serverIp }}
    readOnly: {{ and (ne $volumePath $.dataVolumePath) (ne $volumePath $.validatorKeysVolumePath) }}
{{- else }}
  hostPath:
    path: {{ $volumePath }}
{{- end -}}
{{- end -}}
{{- end -}}
