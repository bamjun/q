#!/bin/bash

PURPLE_BG='\033[48;5;98m'
SELECT_BG='\033[38;5;196m\033[48;5;192m'
NO_COLOR='\033[0m'

##################### 버전관리 start

version_index="0.0.4"


# 버전 체크
if [ "$1" = "check_version" ]; then
    echo "$version_index"
    exit 1
fi

github_repo_version=$(curl -s "https://bamjun.github.io/q/env/env_createTempForder.sh" | bash -s -- check_version)

if [ "$version_index" != "$github_repo_version" ]; then
    echo "레포지토리 버전과 틀립니다."
    echo -e "1 : 레포지토리 버전으로 덮어쓰기 ${PURPLE_BG} (do ' some.sh' not '. some.sh') ${NO_COLOR} "
    echo "2 : 그냥 종료"
    echo "3 : 기존 스크립트 실행"
    read choose_index
    if [ "$choose_index" == "1" ]; then
        script_path=$(realpath "$0")
        curl -o $script_path "https://bamjun.github.io/q/env/env_createTempForder.sh"
        exit 1
    elif [ "$choose_index" == "2" ]; then
        return 1
    fi
fi

##################### 버전관리 end


# 오늘 날짜를 YYYY-MM-DD 형식으로 설정
today=$(date +%Y-%m-%d)

# 해당 날짜의 폴더 이름 설정
directory="/c/projects/temp/Folder_$today"

# 폴더가 존재하는지 확인하고 없으면 생성
if [ ! -d "$directory" ]; then
    echo "폴더 '$directory' 가 존재하지 않아 생성합니다."
    mkdir -p "$directory/001"
    new_folder="$directory/001"
    echo "폴더 '$new_folder'를 생성했습니다."
else
    subfolder=1
    while [ -d "$directory/$(printf '%03d' $subfolder)" ]; do
        subfolder=$(( subfolder + 1))
    done
    new_folder="$directory/$(printf '%03d' $subfolder)"
    mkdir "$new_folder"
    echo "폴더 '$new_folder'를 생성했습니다."
fi

# 폴더로 이동
echo "폴더 '$new_folder' 로 이동합니다."
cd $new_folder

# `. temp 1` 일때 임시폴더의 경로를 윈도우 브라우저로 실행하기
if [ "$1" = "1" ]; then 
    explorer .
# `. temp 2` 일때 vscode 실행하기
elif [ "$1" = "2" ]; then
    code .
fi