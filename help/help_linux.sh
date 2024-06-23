#!/bin/bash

COLOR_RESET="\033[0m"

echo -e "\033[48;5;11m\033[38;5;21m◇  linux  ◇ ${COLOR_RESET}"

echo -e "\033[48;5;228m\033[38;5;0m  - To check the disk usage of the top-level directories ${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    sudo du -h --max-depth=1 / ${COLOR_RESET}"
echo -e "\033[48;5;228m\033[38;5;0m  - Check the Current Shell ${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    echo $SHELL ${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    echo grep [사용자] /etc/passwd ${COLOR_RESET}"
echo -e "\033[48;5;228m\033[38;5;0m  - List Installed Shell ${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    cat /etc/shells ${COLOR_RESET}"
echo -e "\033[48;5;228m\033[38;5;0m  - Change Shell ${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    chsh -s [쉘경로] ${COLOR_RESET}"
echo ""
echo -e "\033[48;5;228m\033[38;5;0m  - Searching process ${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    sudo lsof -i :80 ${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    sudo lsof -i :443 ${COLOR_RESET}"
echo -e "\033[48;5;228m\033[38;5;0m  - Searching process ${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    sudo kill -9 <PID> ${COLOR_RESET}"