#!/bin/bash

COLOR_RESET="\033[0m"


echo -e "\033[48;5;11m\033[38;5;21m◇  git  ◇${COLOR_RESET}"

echo -e "\033[48;5;228m\033[38;5;0m  - 강제 pull${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    git stash push -m "Saving changes to entrypoint.sh before merging"${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    git pull${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    git stash pop${COLOR_RESET}"

echo -e "\033[48;5;228m\033[38;5;0m  - ubuntu nano 설치${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    apt-get update && apt-get install nano${COLOR_RESET}"
echo -e "\033[48;5;228m\033[38;5;0m  - red-hat cent nano 설치${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    yum install nano${COLOR_RESET}"

echo -e ""

echo -e "\033[48;5;228m\033[38;5;0m  - 깃 커밋 템플릿 등록${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    git config --global commit.template '[경로]'${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    git config --global commit.template 'C:\projects\temp\Folder_2024-08-23\001\f.txt'${COLOR_RESET}"
echo -e "\033[48;5;228m\033[38;5;0m  - 깃 커밋할때 열리는 에디터 등록${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    git config --global core.editor '에디터 실행'${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    git config --global core.editor 'code --wait'${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    git config --global core.editor 'nano'${COLOR_RESET}"