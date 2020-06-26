kubectl run ubuntu-nginx --image=magicalpsy/ubuntu_nginx --port=80
kubectl get deployments
kubectl expose deployment/ubuntu-nginx --type="NodePort" --port 80
kubectl scale deployment ubuntu-nginx --replicas=20
kubectl get deployments
kubectl describe deployments/ubuntu-nginx
kubectl get service
