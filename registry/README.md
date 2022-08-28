#### Creating ssl certificate and key:
```
mkdir registry 
mkdir certs
openssl req -x509 -newkey rsa:4096 -days 365 -nodes -sha256 -keyout certs/tls.key -out certs/tls.crt -subj "/CN=docker-registry" -addext "subjectAltName = DNS:docker-registry"
```
#### Creating Docker registry username and password:
```
mkdir auth
docker run --rm --entrypoint htpasswd registry:2.6.2 -Bbn myuser 123 > auth/htpasswd
```

#### Adding certificate, username & password as Kubernetes secrets: 
```
kubectl create secret tls certs-secret --cert=registry/certs/tls.crt --key=registry/certs/tls.key 
kubectl create secret generic auth-secret --from-file=registry/auth/htpasswd 
```
#### Deploying the registry:
```
kubectl apply -f registry/registry-pvc.yaml
kubectl apply -f registry/docker-registry-deployment-svc.yaml 
```
#### Add the certificate to use in the Docker command:
```
sudo mkdir -p /etc/docker/certs.d/docker-registry:30000
sudo cp certs/tls.crt /etc/docker/certs.d/docker-registry:30000/ca.crt
docker login docker-registry:30000 -u myuser -p 123
```
#### Add "<IP> docker-registry" to /etc/hosts in all nodes: 
```
sudo sh -c 'echo "10.0.0.225 docker-registry" >> /etc/hosts'
```
#### Updating system certificate:
```
sudo cp registry/certs/* /usr/local/share/ca-certificates/
sudo update-ca-certificates
```

#### K3S configuration (restart after applying).
```
cat <<EOF > /etc/rancher/k3s/registries.yaml
mirrors:
  "docker-registry:30000":
    endpoint:
      - "https://docker-registry:30000"
configs:
  "docker-registry:30000":
    tls:
      cert_file: "/usr/local/share/ca-certificates/registry.crt"
      key_file: "/usr/local/share/ca-certificates/registry.key"
    auth:
      username: "myuser"
      password: "123"
EOF
sudo systemctl restart k3s
```
