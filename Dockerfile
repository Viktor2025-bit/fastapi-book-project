# Stage 1: Build the FastAPI application
FROM python:3.10-slim as builder

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Stage 2: Set up Nginx and serve the FastAPI application
FROM nginx:alpine

# Copy the Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the FastAPI application from the builder stage
COPY --from=builder /app /app

# Expose the port Nginx will run on
EXPOSE 10000

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]