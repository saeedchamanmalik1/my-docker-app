# 1. Base image
FROM python:3.9-slim

# 2. Set working directory
WORKDIR /app

# 3. Copy files
COPY requirements.txt .
COPY app.py .

# 4. Install dependencies
RUN pip install -r requirements.txt

# 5. Expose port
EXPOSE 5000

# 6. Run application
CMD ["python", "app.py"]
