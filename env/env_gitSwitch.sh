#!/bin/bash

PURPLE_BG='\033[48;5;98m'
RED_BG='\033[48;5;124m'
SELECT_BG='\033[38;5;196m\033[48;5;192m'
NO_COLOR='\033[0m'

##################### 버전관리 start
version_index="0.0.5"

# 버전 체크
if [ "$1" = "check_version" ]; then
    echo "$version_index"
    exit 1
fi

github_repo_version=$(curl -s "https://bamjun.github.io/q/env/env_gitSwitch.sh" | bash -s -- check_version)

if [ "$version_index" != "$github_repo_version" ]; then
    echo "레포지토리 버전과 틀립니다."
    echo -e "1 : 레포지토리 버전으로 덮어쓰기 ${PURPLE_BG} (do ' some.sh' not '. some.sh') ${NO_COLOR} "
    echo "2 : 그냥 종료"
    echo "3 : 기존 스크립트 실행"
    read choose_index
    if [ "$choose_index" == "1" ]; then
        script_path=$(realpath "$0")
        curl -o $script_path "https://bamjun.github.io/q/env/env_gitSwitch.sh"
        exit 1
    elif [ "$choose_index" == "2" ]; then
        return 1
    fi
fi
##################### 버전관리 end

# 삭제 모드 체크
DELETE_MODE=false
if [ "$1" = "d" ]; then
    DELETE_MODE=true
fi

# 메인 로직을 함수로 래핑
show_and_manage_branches() {
    # git branch 명령어로 브랜치 목록 가져오기
    branches=$(git branch | sed 's/^..//')

    # 현재 브랜치 식별
    current_branch=$(git branch --show-current)

    # 스테이지에 올라가지 않은 변경 사항이 있는지 확인
    if ! git diff-index --quiet HEAD --; then
        echo -e "${PURPLE_BG} You have unstaged changes. Please commit or stash them before switching branches. ${NO_COLOR}"
        return 1
    fi

    # 브랜치 목록을 배열로 변환
    IFS=$'\n' read -r -d '' -a branch_array <<< "$branches"

    # 정렬된 브랜치 배열 생성
    sorted_branches=()

    # main 브랜치가 있으면 먼저 추가
    for branch in "${branch_array[@]}"; do
        branch_name="${branch//\*/}"
        branch_name="${branch_name## }"
        if [[ "$branch_name" == "main" ]]; then
            sorted_branches+=("$branch")
            break
        fi
    done

    # dev 브랜치가 있으면 그 다음에 추가
    for branch in "${branch_array[@]}"; do
        branch_name="${branch//\*/}"
        branch_name="${branch_name## }"
        if [[ "$branch_name" == "dev" ]]; then
            sorted_branches+=("$branch")
            break
        fi
    done

    # 나머지 브랜치들을 추가 (main과 dev 제외)
    for branch in "${branch_array[@]}"; do
        branch_name="${branch//\*/}"
        branch_name="${branch_name## }"
        if [[ "$branch_name" != "main" && "$branch_name" != "dev" ]]; then
            sorted_branches+=("$branch")
        fi
    done

    # branch_array를 정렬된 배열로 교체
    branch_array=("${sorted_branches[@]}")

    # 브랜치 목록을 번호와 함께 출력 (1번부터 시작)
    if [ "$DELETE_MODE" = true ]; then
        echo -e "${RED_BG}Select a branch to delete: ${NO_COLOR}"
    else
        echo -e "${PURPLE_BG}Select a branch to switch to: ${NO_COLOR}"
    fi

    for i in "${!branch_array[@]}"; do
        branch_name="${branch_array[$i]//\*/}"
        branch_name="${branch_name## }"  # Remove leading spaces
        if [[ "$branch_name" == "$current_branch" ]]; then
            echo -e "${SELECT_BG}$((i + 1)))   ${branch_array[$i]}  ${NO_COLOR}"
        else
            echo "$((i + 1)))   ${branch_array[$i]}  "
        fi
    done

    # 사용자 입력 받기
    if [ "$DELETE_MODE" = true ]; then
        echo -e -n "${RED_BG}Enter the number of the branch to delete (q to quit): ${NO_COLOR}"
    else
        echo -e -n "${PURPLE_BG}Enter the number of the branch (q to quit): ${NO_COLOR}"
    fi
    read branch_number

    # 종료 조건 체크
    if [ "$branch_number" = "q" ]; then
        return 0
    fi

    # 유효한 번호인지 확인
    if ! [[ "$branch_number" =~ ^[0-9]+$ ]] || [ "$branch_number" -lt 1 ] || [ "$branch_number" -gt "${#branch_array[@]}" ]; then
        echo "Invalid branch number."
        return 1
    fi

    # 선택한 번호에 해당하는 브랜치 처리
    selected_branch="${branch_array[$((branch_number - 1))]}"
    selected_branch="${selected_branch//\*/}"
    selected_branch="${selected_branch## }"  # Remove leading spaces

    if [ "$DELETE_MODE" = true ]; then
        if [ "$selected_branch" = "$current_branch" ]; then
            echo "Cannot delete the current branch."
            sleep 2
            return 2
        fi
        git branch -d "$selected_branch"
        if [ $? -eq 0 ]; then
            echo "Branch $selected_branch deleted successfully."
            sleep 1
            return 2
        fi
    else
        git switch "$selected_branch"
        echo "Switched to branch $selected_branch"
    fi
}

# 메인 루프
while true; do
    show_and_manage_branches
    exit_code=$?
    
    if [ $exit_code -eq 0 ]; then
        break
    elif [ $exit_code -eq 1 ]; then
        break
    elif [ $exit_code -eq 2 ] && [ "$DELETE_MODE" = true ]; then
        continue
    else
        break
    fi
done
