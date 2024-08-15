#!/bin/bash

COLOR_RESET="\033[0m"
COLOR_RED_BACKGROUND="\033[48;5;1m"

echo -e "\033[48;5;11m\033[38;5;21m◇  docker  ◇${COLOR_RESET}"

echo -e "\033[48;5;228m\033[38;5;0m  - 도커컴포즈 백그라운드 파일실행${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    sudo docker-compose -f docker-compose.yml up --build -d${COLOR_RESET}"
echo -e "\033[48;5;228m\033[38;5;0m  - 도커 로그보기${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    docker logs [컨테이너명]${COLOR_RESET}"
echo -e "\033[48;5;228m\033[38;5;0m  - 독커에서 실행중인 프로세서 보기${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    docker ps -a${COLOR_RESET}"
echo -e "\033[48;5;228m\033[38;5;0m  - 도커 디렉토리${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    sudo ls -la /var/lib/docker${COLOR_RESET}"
echo -e "\033[48;5;228m\033[38;5;0m  - 포트 조회${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    telnet${COLOR_RESET}"
echo -e "\033[48;5;228m\033[38;5;0m  - 프로세서 터미널 실행하기${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    sudo docker exec -it [프로세서명] /bin/bash${COLOR_RESET}"
echo -e "\033[48;5;228m\033[38;5;0m  - 프로세서 터미널 실행하기${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    docker run --rm -it [your-image-name] bash${COLOR_RESET}"
echo -e "\033[48;5;228m\033[38;5;0m  - Rebuild the Docker Image${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    docker build -t [your-image-name] .${COLOR_RESET}"
echo -e "\033[48;5;228m\033[38;5;0m  - Clear Docker Cache${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    docker build --no-cache -t [your-image-name] .${COLOR_RESET}"


echo ""
echo -e "${COLOR_RED_BACKGROUND} ∇ ∇ ∇ ∇ ∇ 초기화 ∇ ∇ ∇ ∇ ∇ ${COLOR_RESET}"
echo -e "\033[48;5;228m\033[38;5;0m  - 모든 Docker 컨테이너 중지${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    docker stop \$(docker ps -aq)${COLOR_RESET}"
echo -e "\033[48;5;228m\033[38;5;0m  - 모든 Docker 컨테이너 삭제${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    docker rm \$(docker ps -aq)${COLOR_RESET}"
echo -e "\033[48;5;228m\033[38;5;0m  - 모든 Docker 이미지 삭제${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    docker rmi \$(docker images -q)${COLOR_RESET}"
echo -e "\033[48;5;228m\033[38;5;0m  - 모든 이미지 강제 삭제${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    docker rmi -f \$(docker images -q)${COLOR_RESET}"

echo -e "\033[48;5;228m\033[38;5;0m  - 정리되지 않은 파일을 정리${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    docker system prune -a${COLOR_RESET}"
echo -e "\033[48;5;228m\033[38;5;0m  - 사용되지 않는 볼륨 정리${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    docker volume prune${COLOR_RESET}"
echo -e "\033[48;5;228m\033[38;5;0m  - Docker 빌드 캐시 정리${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    docker builder prune${COLOR_RESET}"
echo -e "\033[48;5;228m\033[38;5;0m  - Docker 볼륨 전체 삭제${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    docker volume rm $(docker volume ls -q)${COLOR_RESET}"
echo -e "${COLOR_RED_BACKGROUND} ∆ ∆ ∆ ∆ ∆ 초기화 ∆ ∆ ∆ ∆ ∆ ${COLOR_RESET}"
echo ""

echo ""
echo -e "${COLOR_RED_BACKGROUND} ∇ ∇ ∇ ∇ ∇ postgresql ∇ ∇ ∇ ∇ ∇ ${COLOR_RESET}"
echo -e "\033[48;5;228m\033[38;5;0m  - Docker postgresql 컨테이너 db 진입${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    sudo docker exec -it [container ID] psql -U admin -d postgres${COLOR_RESET}"
echo -e "\033[48;5;228m\033[38;5;0m  - 데이터베이스 목록 확인${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    \l${COLOR_RESET}"
echo -e "\033[48;5;228m\033[38;5;0m  - 데이터베이스 선택${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    \c [database_name]${COLOR_RESET}"
echo -e "\033[48;5;228m\033[38;5;0m  - 테이블 조회${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    \dt${COLOR_RESET}"
echo -e "\033[48;5;228m\033[38;5;0m  - 새로운 데이터베이스 생성${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    CREATE DATABASE db;${COLOR_RESET}"
echo -e "\033[48;5;228m\033[38;5;0m  - 데이터베이스 삭제${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    DROP DATABASE db;${COLOR_RESET}"
echo -e "${COLOR_RED_BACKGROUND} ∆ ∆ ∆ ∆ ∆ postgresql ∆ ∆ ∆ ∆ ∆ ${COLOR_RESET}"
echo ""

