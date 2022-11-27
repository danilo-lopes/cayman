{{/*
    chart name and version as used by the chart label
*/}}
{{- define "voting.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
    the name of the chart
*/}}
{{- define "voting.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
    common labels
*/}}
{{- define "voting.labels" -}}
helm.sh/chart: {{ include "voting.chart" . }}
{{ include "voting.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/name: {{ include "voting.name" . }}
app.kubernetes.io/part-of: emojivoto
{{- end }}

{{/*
    selector labels
*/}}
{{- define "voting.selectorLabels" -}}
app: voting-svc
{{- end }}

{{/*
    container name
*/}}
{{- define "voting.containerName" -}}
voting-svc
{{- end }}

{{/*
    service account
*/}}
{{- define "voting.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "voting.name" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}