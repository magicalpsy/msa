## 0. 선행 작업
```
Doker Hub 에 image 가 있어야함.
```
# ** k8s.sh 의 상세 설명 및 결과 ** 
## 1. 파일 불러 오고 배치 하기
```
kubectl run <Deploy명> --image=<DockHub이미지> --port=80
예시
kubectl run ubuntu-nginx --image=magicalpsy/ubuntu_nginx --port=80  
```
## 1-1. 배치 확인
```
kubectl get deployments
### - 결과 확인
$ kubectl get deployments
NAME                READY   UP-TO-DATE   AVAILABLE   AGE
abcde               1/1     1            1           42m
nginx               4/4     4            4           4h45m
ubuntu-nginx        1/1     1            1          3m35s
```
## 2. Pod 20개 사용
```
kubectl scale deployment ubuntu-nginx --replicas=20
```
## 3. Service port 지정
```
kubectl expose deployment/ubuntu-nginx --type="NodePort" --port 80
```
## 4. 포트 확인 하기
```
kubectl describe deployments/ubuntu-nginx
### - 결과 확인
$ kubectl describe deployments/ubuntu-nginx
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  run=ubuntu-nginx
  Containers:
   ubuntu-nginx:
    Image:        magicalpsy/ubuntu_nginx
    Port:         80/TCP
    Host Port:    0/TCP
    Environment:  <none>
    Mounts:       <none>
  Volumes:        <none>
Conditions:
```
## 5. service 포트 확인 및 및 실행 확인
```
포트 확인
$ kubectl.exe get service
```
```
결과
NAME                TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
kubernetes          ClusterIP   10.96.0.1        <none>        443/TCP        6h37m
nginx               NodePort    10.109.254.143   <none>        80:32565/TCP   175m
ubuntu-nginx        NodePort    10.99.223.249    <none>        80:31037/TCP   39m
```
```
실행 확인
$ curl localhost:31037
```
```
결과
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   612  100   612    0     0  55636      0 --:--:-- --:--:-- --:--:-- 55636<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```
