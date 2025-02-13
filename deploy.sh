#!/bin/bash

# Navigate to the project directory
cd /path/to/your/project

# Pull the latest changes
git pull origin main

# Install dependencies
source venv/bin/activate
pip install -r requirements.txt

# Restart the FastAPI application
sudo systemctl restart your_fastapi_service