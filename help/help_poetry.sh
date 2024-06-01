#!/bin/bash

COLOR_RESET="\033[0m"

echo -e "\033[48;5;11m\033[38;5;21m◇  poetry  ◇ ${COLOR_RESET}"

echo -e "\033[48;5;228m\033[38;5;0m  - start poetry${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    - 포이트리 기본 패키지로 시작${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m      poetry new [app] [경로 . 으로 입력시 현재경로에 패키지 설치]${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    - 파이썬 버전설정가능${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m      poetry init${COLOR_RESET}"

echo -e "\033[48;5;228m\033[38;5;0m  - 환경설정${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    poetry env info${COLOR_RESET}"