FROM python:3.11.15-slim

WORKDIR /app

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
