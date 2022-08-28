#!/bin/sh
helm repo add postgres-operator-charts https://opensource.zalando.com/postgres-operator/charts/postgres-operator || exit 1
helm install postgres-operator postgres-operator-charts/postgres-operator --values pg-operator-values.yaml || exit 1

