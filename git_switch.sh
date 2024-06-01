#!/bin/bash


PURPLE_BG='\033[48;5;98m'
SELECT_BG='\033[38;5;196m\033[48;5;192m'
NO_COLOR='\033[0m'



##################### 버전관리 start

version_index="0.0.1"


# 버전 체크
if [ "$1" = "check_version" ]; then
    echo "$version_index"
    exit 1
fi

github_repo_version=$(curl -s "https://bamjun.github.io/q/git_switch.sh" | bash -s -- check_version)

if [ "$version_index" != "$github_repo_version" ]; then
    echo "레포지토리 버전과 틀립니다."
    echo -e "1 : 레포지토리 버전으로 덮어쓰기 ${PURPLE_BG} (do ' some.sh' not '. some.sh') ${NO_COLOR} "
    echo "2 : 그냥 종료"
    echo "3 : 기존 스크립트 실행"
    read choose_index
    if [ "$choose_index" == "1" ]; then
        script_path=$(realpath "$0")
        curl -o $script_path "https://bamjun.github.io/q/git_switch.sh"
        exit 1
    elif [ "$choose_index" == "2" ]; then
        return 1
    fi
fi

##################### 버전관리 end







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
echo "$IFS"
# 브랜치 목록을 번호와 함께 출력 (1번부터 시작)
echo -e "${PURPLE_BG}Select a branch to switch to: ${NO_COLOR}"
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
echo -e -n "${PURPLE_BG}Enter the number of the branch: ${NO_COLOR}"
read branch_number

# 유효한 번호인지 확인
if ! [[ "$branch_number" =~ ^[0-9]+$ ]] || [ "$branch_number" -lt 1 ] || [ "$branch_number" -gt "${#branch_array[@]}" ]; then
  echo "Invalid branch number."
  return 1
fi

# 선택한 번호에 해당하는 브랜치로 switch
selected_branch="${branch_array[$((branch_number - 1))]}"
selected_branch="${selected_branch//\*/}"
selected_branch="${selected_branch## }"  # Remove leading spaces

git switch "$selected_branch"

echo "Switched to branch $selected_branch"
