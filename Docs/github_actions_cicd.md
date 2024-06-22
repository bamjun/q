GitHub Actions를 사용하여 배포 파이프라인을 설정하는 방법을 설명합니다. 주어진 YAML 파일을 기반으로 GitHub Secrets 설정 및 GitHub Actions 설정을 완료할 수 있도록 안내하겠습니다.

### 1. GitHub Secrets 설정

먼저, 배포에 필요한 SSH 정보 및 기타 비밀 정보를 GitHub Secrets에 추가해야 합니다.

1. **GitHub Repository로 이동**: 배포하려는 리포지토리 페이지로 이동합니다.
2. **Settings로 이동**: 리포지토리 상단 메뉴에서 `Settings`를 클릭합니다.
3. **Secrets 설정**: 왼쪽 사이드바에서 `Secrets and variables` > `Actions`를 클릭합니다.
4. **New repository secret 추가**: `New repository secret` 버튼을 클릭하여 아래와 같은 Secrets를 추가합니다:
    - `SERVER_HOST`: 배포할 서버의 IP 주소 또는 도메인 이름
    - `SERVER_USER`: 서버에 접속할 사용자 이름
    - `SERVER_SSH_KEY`: 서버에 접속할 때 사용할 SSH 개인 키 (base64로 인코딩된 형태로 저장) pemkey
    - `AWS_SSH_PORT`: SSH 접속 포트 (기본 포트는 `22`)

### 2. GitHub Actions 설정

`.github/workflows/deploy.yml`

```yml
name: Deploy to Server

on:
  push:
    branches:
      - main  # 또는 배포하고 싶은 브랜치 이름

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout repository
      uses: actions/checkout@v3

    - name: Deploy to server
      uses: appleboy/ssh-action@master
      with:
        host: ${{ secrets.SERVER_HOST }}
        username: ${{ secrets.SERVER_USER }}
        key: ${{ secrets.SERVER_SSH_KEY }}
        port: ${{ secrets.AWS_SSH_PORT }}
        script: |
            cd ~/catceo_coin
            git stash
            git pull origin main
            sudo docker-compose -f docker-compose.yml up --build -d
```