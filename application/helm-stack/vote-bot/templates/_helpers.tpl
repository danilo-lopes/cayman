{{/*
    chart name and version as used by the chart label
*/}}
{{- define "vote-bot.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
    the name of the chart
*/}}
{{- define "vote-bot.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
    common labels
*/}}
{{- define "vote-bot.labels" -}}
helm.sh/chart: {{ include "vote-bot.chart" . }}
{{ include "vote-bot.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/name: {{ include "vote-bot.name" . }}
app.kubernetes.io/part-of: emojivoto
{{- end }}

{{/*
    selector labels
*/}}
{{- define "vote-bot.selectorLabels" -}}
app: vote-bot-svc
{{- end }}

{{/*
    container name
*/}}
{{- define "vote-bot.containerName" -}}
vote-bot-svc
{{- end }}

{{/*
    service account
*/}}
{{- define "vote-bot.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "vote-bot.name" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}