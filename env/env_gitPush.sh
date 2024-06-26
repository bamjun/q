#!/usr/bin/env bash
#11


PURPLE_BG='\033[48;5;98m'
SELECT_BG='\033[38;5;196m\033[48;5;192m'
NO_COLOR='\033[0m'




version_index="0.0.4"

# 버전 체크
if [ "$1" = "check_version" ]; then
    echo "$version_index"
    exit 1
fi

github_repo_version=$(curl -s "https://bamjun.github.io/q/env/env_gitPush.sh" | bash -s -- check_version)

if [ "$version_index" != "$github_repo_version" ]; then
    echo "레포지토리 버전과 틀립니다."
    echo -e "1 : 레포지토리 버전으로 덮어쓰기 ${PURPLE_BG} (do ' some.sh' not '. some.sh') ${NO_COLOR} "
    echo "2 : 그냥 종료"
    echo "3 : 기존 스크립트 실행"
    read choose_index
    if [ "$choose_index" == "1" ]; then
        script_path=$(realpath "$0")
        curl -o $script_path "https://bamjun.github.io/q/env/env_gitPush.sh"
        exit 1
    elif [ "$choose_index" == "2" ]; then
        return 1
    fi
fi


# 변경된 파일들을 스테이징 영역에 추가
git add .

# `git status` 명령어의 결과를 변수에 저장
status=$(git status)

# "working tree clean"이 포함되어 있으면 변경 사항이 없는 것으로 판단
if [[ $status == *"working tree clean"* ]]; then
    echo "변경 사항이 없어 커밋할 내용이 없습니다."
else
    # 변경 사항이 있는지 확인하고 커밋 메시지를 받음
echo -e "\033[48;5;11m\033[38;5;21m Feat ${NO_COLOR}: 새로운 기능 구현  \033[48;5;11m\033[38;5;21m Add ${NO_COLOR}: 에셋 파일 추가  \033[48;5;11m\033[38;5;21m Fix ${NO_COLOR}: 버그 수정  \033[48;5;11m\033[38;5;21m Docs ${NO_COLOR}: 문서 추가 및 수정
\033[48;5;11m\033[38;5;21m Style ${NO_COLOR}: 스타일링 작업  \033[48;5;11m\033[38;5;21m Refactor ${NO_COLOR}: 코드 리팩토링 (동작 변경 없음)  \033[48;5;11m\033[38;5;21m Test ${NO_COLOR}: 테스트
\033[48;5;11m\033[38;5;21m Deploy ${NO_COLOR}: 배포  \033[48;5;11m\033[38;5;21m Conf ${NO_COLOR}: 빌드, 환경 설정  \033[48;5;11m\033[38;5;21m Chore ${NO_COLOR}: 기타 작업
\033[38;5;196m\033[48;5;82m커밋 메시지를 입력하세요:${NO_COLOR}"
    read index
    # 변경 사항이 있으면 커밋을 수행
    if [ -z "$index" ]; then
        echo "커밋 메시지가 입력되지 않았습니다."
    else
        # 등록된 원격 저장소 목록을 가져옴
        remotes=$(git remote)
        # 원격 저장소 개수 계산
        remote_count=$(echo "$remotes" | wc -l)
        # 원격 저장소가 하나이고, 그 이름이 'origin'인지 확인
        if [[ $remote_count -eq 1 && $remotes == "origin" ]]; then
            git commit -m "$index"
            # 현재 브랜치 이름을 찾는 명령어
            current_branch=$(git rev-parse --abbrev-ref HEAD)
            # 현재 브랜치로 푸시
            git push origin $current_branch
        else
            echo "여러 원격 저장소가 있거나 'origin'이 유일한 원격 저장소가 아닙니다."
            echo "등록된 원격 저장소 목록:"
            echo "$remotes"
        fi
    fi
fi
