{{- define "teku.volumeMounts" }}
{{- $uniqueVolumes := fromYaml (include "teku.unique.volumes" . ) }}
{{- range $volumePath, $volumeName := $uniqueVolumes }}
- name: {{ $volumeName }}
  mountPath: {{ $volumePath }}
  readOnly: {{ and (ne $volumePath $.dataDirPath) (ne $volumePath $.validatorKeysDirPath) }}
{{- end -}}
{{- end -}}
