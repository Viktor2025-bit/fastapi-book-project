FROM python:3.10-slim

# Install necessary packages
RUN apt-get update && apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

# Install FastAPI dependencies
WORKDIR /app
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy app files and Nginx configuration
COPY . /app
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 for the app
EXPOSE 80

# Start Nginx and FastAPI with uvicorn
CMD ["sh", "-c", "nginx && uvicorn main:app --host 0.0.0.0 --port 8000"]
