# 0.  작업 Dockerfile(build script) 만들기(사용법)
```
1-1. touch Dockerfile # 이름 까지 동일 해야 함.
1-2. 편집기로 Dockerfile 진입
1-3. build script 만들기
    FROM ubuntu   ## dock 허브의 ubuntu 이미지가 베이스가 됨
    RUN apt update ## apt update를 통해 app 설치 환경 설정
    RUN apt install -y nginx ## nginx 를 설치 할 때
    CMD ["nginx", "-g", "daemon off;"] ## nginx 데몬을 실행 해서 웹 어플리 케이션 준비
```
# 0-1 참고 사항
```
  계정명 = magicalpsy
  생성되는(된) 이미지명 = ubuntu_nginx
  컨테이너 명 = name n1
  포트 지정 외부 포트 8888 과 생성 이미지 80 연결 = -p 8888:80
```
# 1. git clone 하여 Dockerfile 다운 받기
```
Git 에서 Docker build 파일 받기
  git clone https://github.com/magicalpsy/msa.git  
  cd msa
  ls

결과 확인 (Dockerfile 이 있는지 확인 하기)
  user@DESKTOP-14530KF MINGW64 ~/work/msa (master)
  $ ls
  Dockerfile  k8s/  README.md
```
# 2. Dockerfile Build 부터 실행 까지
## 2-1 Dockerfile Build(이미지 생성)
```
build : docker build -t magicalpsy/ubuntu_nginx .
```
## 2-2 결과확인
```
결과확인
$ docker images
REPOSITORY                           TAG                                              IMAGE ID            CREATED             SIZE
magicalpsy/ubuntu_nginx              latest                                           debd948b5016        4 minutes ago       155MB
magicalpsy/nginx                     latest                                           4a29fccac1a9        46 hours ago        183MB
```
## 2-3 Docker image 실행
```
$ winpty docker run -it --name n1 -p 8888:80 magicalpsy/ubuntu_nginx
```
## 2-4 결과확인
```
$ curl localhost:8888

  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   612  100   612    0     0  68000      0 --:--:-- --:--:-- --:--:-- 68000<!DOCTYPE html>
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
# 3. Dockhub 에 push 하기
```
  docker push magicalpsy/ubuntu_nginx
```
