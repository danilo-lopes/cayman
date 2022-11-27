# Cayman
Cayman Infrastructure from Ília challenge

## First

Infrastruture artifacts in:

1. `./infra/`
2. `./observability/`
3. `./helm/`

## We have here:

- VPC and EKS terraform code
- Prometheus stack for monitoring our applications inside EKS cluster
- Loki fetching and aggregating logs from applications and view them on Grafana
- Sample microservice application to monitor