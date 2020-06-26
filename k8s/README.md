## 0. 선행 작업
```
Doker Hub 에 image 가 있어야함.
```
## 1. 파일 불러 오고 배치 하기
```
kubectl run <Deploy명> --image=<DockHub이미지> --port=80
예시
kubectl run ubuntu-nginx --image=magicalpsy/ubuntu_nginx --port=80  
```
## 1-1. 배치 확인
```
kubectl get deployments
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
```
