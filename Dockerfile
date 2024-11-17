FROM python:3.8-slim-buster

# 작업 디렉토리
WORKDIR /app

# requirements.txt만 복사하여 캐싱 최적화
COPY requirements.txt .

# 의존성 설치
RUN pip3 install --no-cache-dir -r requirements.txt

# 전체 소스 코드 컨테이너 내의 작업 디렉터리로 복사
COPY app.py .

# Flask 앱 실행
CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0", "--port=4000"]
