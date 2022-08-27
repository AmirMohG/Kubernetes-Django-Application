#!/bin/sh
helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
helm install  nfs-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
  --values nfs-external-provisioner-values.yaml
# Disabling the default sotrageclass in k3s. Make sure you don't have another sc set to default.
kubectl patch storageclass local-path -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"false"}}}'
