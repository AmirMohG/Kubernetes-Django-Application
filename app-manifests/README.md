#### Why Nginx as a deployment?
Using ingress to serve static files is bad practice, so we added Nginx as ```kind: Deployment``` to serve django static files.

#### Note for anyone using other ingress controllers:
This line is required in the ```kind: Ingress``` manifest. Don't forget to change it in your case...
```kubernetes.io/ingress.class: <ingress-controler-name>```

