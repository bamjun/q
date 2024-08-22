#!/bin/bash

# django_code.txt 파일 초기화
> django_code.txt

# 전체 디렉터리 순회하며 models.py 파일 찾기
find . -name "models.py" | while read -r file; do
    # 경로를 django_code.txt에 기록
    echo "\`\`\`$file" >> django_code.txt
    # models.py 파일의 내용을 django_code.txt에 기록
    cat "$file" >> django_code.txt
    # 경로와 내용 사이에 구분을 위해 줄 추가
    echo -e "\n\`\`\`\n" >> django_code.txt
done

# 전체 디렉터리 순회하며 urls.py 파일 찾기
find . -name "urls.py" | while read -r file; do
    # 경로를 django_code.txt에 기록
    echo "\`\`\`$file" >> django_code.txt
    # urls.py 파일의 내용을 django_code.txt에 기록
    cat "$file" >> django_code.txt
    # 경로와 내용 사이에 구분을 위해 줄 추가
    echo -e "\n\`\`\`\n" >> django_code.txt
done

# 전체 디렉터리 순회하며 views.py 파일 찾기
find . -name "views.py" | while read -r file; do
    # 경로를 django_code.txt에 기록
    echo "\`\`\`$file" >> django_code.txt
    # views.py 파일의 내용을 django_code.txt에 기록
    cat "$file" >> django_code.txt
    # 경로와 내용 사이에 구분을 위해 줄 추가
    echo -e "\n\`\`\`\n" >> django_code.txt
done