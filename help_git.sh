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