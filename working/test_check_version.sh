#!/bin/bash


PURPLE_BG='\033[48;5;98m'
NO_COLOR='\033[0m'


check_version_shell_script_version_index="0.0.1"

# 버전 체크
if [ "$1" = "check_version" ]; then
    echo "$check_version_shell_script_version_index"
    exit 1
fi





# 버전 체크
if [ "$1" = "check_version" ]; then
    echo "$version_index"
    exit 1
fi

github_repo_version=$(curl -s ${github_repo_address} | bash -s -- check_version)

if [ "$version_index" != "$github_repo_version" ]; then
    echo "레포지토리 버전과 틀립니다."
    echo -e "1 : 레포지토리 버전으로 덮어쓰기 ${PURPLE_BG} (do ' some.sh' not '. some.sh') ${NO_COLOR} "
    echo "2 : 그냥 종료"
    echo "3 : 기존 스크립트 실행"
    read choose_index
    if [ "$choose_index" == "1" ]; then
        script_path=$(realpath "$0")
        curl -o $script_path ${github_repo_address}
        exit 1
    elif [ "$choose_index" == "2" ]; then
        exit 1
    fi
fi