# 윈도우 11에서 우분투 22 설치하기


윈도우 에서 wsl 설치해서, 리눅스 사용하기.
- 윈도우 11환경에서, 설치
```cmd
wsl --install
```
설치 완료후 재부팅,(나는 윈도우 스토어에서, 우분투 22 설치후 > wsl --install  > 재부팅함.)

## Ubuntu에 zsh 및 oh-my-zsh 설치하기

- zsh 설치하기

```shell
# zsh 설치
sudo apt-get install zsh

# 설치경로 확인
which zsh
#=> /usr/bin/zsh

# 기본 sh 변경
chsh -s $(which zsh)
```

- oh-my-zsh 설치

```shell
# git wget curl 설치 확인

# oh-my-zsh 설치
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## 테마 사용하기

테마는 zsh의 쉘 환경을 보기좋게 꾸며줍니다. 수많은 테마가 준비되어 있고, 간단하게 `.zshrc` 파일을 수정하는 것만으로 테마를 적용할 수 있습니다. 혹은 웹에서 원하는 테마를 찾아서 추가해 줄 수도 있습니다.

oh-my-zsh를 처음 설치하면 기본적으로 oh-my-zsh의 개발자의 이름인 `robbyrussell` 테마가 설치되어 있습니다.

```shell
ZSH_THEME="robbyrussell"
```

테마를 변경하고 싶다면 간단하게 원하는 테마명으로 변경하면 됩니다.

```shell
ZSH_THEME="random"  
# random은 터미널을 실행할 때마다 랜덤하게 테마가 변경됩니다.
```

