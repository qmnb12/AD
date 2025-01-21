FROM python:3.9.7-slim-buster

# Update and install dependencies
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends gcc libffi-dev musl-dev ffmpeg aria2 python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN useradd -m appuser

# Set the working directory and copy application files
WORKDIR /app/
COPY . /app/

# Change ownership of the app directory to the non-root user
RUN chown -R appuser:appuser /app

# Install Python dependencies
RUN pip3 install --no-cache-dir --upgrade --requirement requirements.txt

# Switch to the non-root user
USER appuser

# Default command
CMD ["python3", "modules/main.py"]
