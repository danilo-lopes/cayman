### Requirements

- `helm`
- `kubectl`

```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
```

### Prometheus Stack Deploy:

**Prometheus version used: "35.5.1"**

```
HELM_CHART_VERSION="35.5.1"
helm upgrade --install prom-stack prometheus-community/kube-prometheus-stack --version "${HELM_CHART_VERSION}" \
  --namespace monitoring \
  --create-namespace \
  -f prometheus-stack/prom-stack-values-v${HELM_CHART_VERSION}.yaml
```

#### After doing this we have:

1. Prometheus and Grafana installed on the cluster
2. Can visualize metrics for the applications in real time on Grafana/Prometheus
3. Configure ServiceMonitors for the services (ex: Emojivoto) throgth Prometheus Operator
4. Use PromQL to query metrics
5. ***Important !*** Grafana and Prometheus is storing data in `emptyDir{}`

### Optional:

Exposing grafana and prometheus with ingress:

```
kubectl apply -f prometheus-stack-ingress.yaml
```

### Grafana Loki Stack Deploy:

**Loki version used: "2.8.7"**

```
HELM_CHART_VERSION="2.8.7"
helm upgrade --install loki grafana/loki-stack --version "${HELM_CHART_VERSION}" \
  --namespace=monitoring \
  --create-namespace \
  -f "loki-stack/loki-stack-values-v${HELM_CHART_VERSION}.yaml
```

```
kubectl replace -f loki-stack/loki-promtail-config.yaml -n monitoring
```

#### After doing this we have:

1. Loki collecting our container logs
2. Grafana now can add Loki data source to query logs using LogQL
3. ***Important !*** Loki is storing the logs as `emptyDir{}`
