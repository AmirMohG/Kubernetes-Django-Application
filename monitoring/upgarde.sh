#!/bin/sh
helm upgrade prom prometheus-community/kube-prometheus-stack -n monitoring --values prometheus-values.yaml
