FROM python:3.12-slim

WORKDIR /app

# COPY SEMUA FILE KE /app
COPY . .

# Install Flask
RUN pip install Flask==3.0.3

EXPOSE 5000

# Jalankan app.py dari /app
CMD ["python", "app.py"]