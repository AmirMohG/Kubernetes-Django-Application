#### Install postgres operator:
```
helm repo add postgres-operator-charts https://opensource.zalando.com/postgres-operator/charts/postgres-operator
helm install postgres-operator postgres-operator-charts/postgres-operator --values pg-operator-values.yaml
```
#### Create Postgress cluster:
```
kubectl apply -f mini-pg-cluster.yaml 
```
