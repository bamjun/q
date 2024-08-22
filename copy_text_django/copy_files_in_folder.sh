
# views_content.txt 파일 초기화
> views_content.txt

# 전체 디렉터리 순회하며 views 폴더 찾기
find . -type d -name "views" | while read -r dir; do
    # views 폴더 안의 모든 파일 순회 (단, __pycache__ 폴더 제외)
    find "$dir" -type f ! -path "*/__pycache__/*" | while read -r file; do
        # 파일 경로를 views_content.txt에 기록 (```로 시작)
        echo "\`\`\`$file" >> views_content.txt
        # 파일 내용을 views_content.txt에 기록
        cat "$file" >> views_content.txt
        # 파일 내용 끝에 ``` 추가
        echo -e "\n\`\`\`\n" >> views_content.txt
    done
done