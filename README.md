# curl 에서 사용하기

```bash
curl https://bamjun.github.io/q/
```

### 스크립트 바로실행

- `curl -s http://example.com/script.sh`는 지정된 URL에서 스크립트를 다운로드합니다. `-s` 옵션은 silent 모드로 curl의 진행 상황 및 오류 메시지를 숨깁니다.
- 파이프(`|`)를 사용하여 `curl`로 다운로드한 데이터를 직접 `bash`에 전달하고 실행합니다.

  ```bash
  curl -s https://bamjun.github.io/q/ | bash
  ```

  ![alt text](images/markdown-image.png)  
  <br>
  ![alt text](images/markdown-image-1.png)  


### up 파일 다운로드받기

- curl -o [저장할 파일명] [다운로드 url]  

  ```bash
  curl -o up https://bamjun.github.io/q/up
  ```

