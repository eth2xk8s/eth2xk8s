{{- define "prysm.volumes" }}
{{- $uniqueVolumes := fromYaml (include "prysm.unique.volumes" . ) }}
{{- range $volumePath, $volumeName := $uniqueVolumes }}
- name: {{ $volumeName }}
{{- if eq $.persistentVolumeType "nfs" }}
  nfs:
    path: {{ $volumePath }}
    server: {{ $.nfs.serverIp }}
    readOnly: {{ ne $volumePath $.dataDirPath }}
{{- else }}
  hostPath:
    path: {{ $volumePath }}
{{- end -}}
{{- end -}}
{{- end -}}
