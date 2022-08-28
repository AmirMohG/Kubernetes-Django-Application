#### Installing the Prometheus stack:
Installing Alertmanager, Grafana and Prometheus-operator using helm in ```namespace: monitoring```.
```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install prom prometheus-community/kube-prometheus-stack -n monitoring \ 
    --create-namespace --values prometheus-values.yaml
```
