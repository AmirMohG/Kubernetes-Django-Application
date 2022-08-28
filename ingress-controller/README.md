#### Installing ingress-nginx controller using helm.
```
helm install ingress-nginx ingress-nginx/ingress-nginx --version 4.2.3 --values ingress-controller-values.yaml
```
You have to use ```kind: Daemonset``` if the svc is ```type: nodePort```. Since you need a controller on each node.
