FROM python:3.11-slim  

WORKDIR /app

COPY backend /app

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5555  


CMD ["celery", "-A", "celery_app", "worker", "--loglevel=info", "-Q", "aubay"]
