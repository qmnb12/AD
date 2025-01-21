# Use the official Python image based on slim-bookworm
FROM python:3.9-slim-bookworm as builder

# Update system and install dependencies
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
        gcc libffi-dev musl-dev ffmpeg aria2 python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user with a specific UID in the required range
RUN useradd -m -u 10014 appuser

# Set the working directory and copy the application files
WORKDIR /app/
COPY . /app/

# Change ownership of the app directory to the created user
RUN chown -R appuser:appuser /app

# Install Python dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Switch to the non-root user
USER appuser

# Command to run the application
CMD ["python3", "modules/main.py"]