{{/*
    chart name and version as used by the chart label
*/}}
{{- define "emoji.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
    the name of the chart
*/}}
{{- define "emoji.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
    common labels
*/}}
{{- define "emoji.labels" -}}
helm.sh/chart: {{ include "emoji.chart" . }}
{{ include "emoji.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/name: {{ include "emoji.name" . }}
app.kubernetes.io/part-of: emojivoto
{{- end }}

{{/*
    selector labels
*/}}
{{- define "emoji.selectorLabels" -}}
app: emoji-svc
{{- end }}

{{/*
    container name
*/}}
{{- define "emoji.containerName" -}}
emoji-svc
{{- end }}

{{/*
    service account
*/}}
{{- define "emoji.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "emoji.name" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}