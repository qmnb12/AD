# Use the official Python 3.9 slim image as the base
FROM python:3.9.7-slim-buster

# Update and install dependencies
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends gcc libffi-dev musl-dev ffmpeg aria2 python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the application files into the container
COPY . /app/

# Set the working directory
WORKDIR /app/

# Install Python dependencies from requirements.txt
RUN pip3 install --no-cache-dir --upgrade --requirement requirements.txt

# Expose the required port for your application
EXPOSE 8080  # Choreo typically expects services to be available on port 8080, but you can change this based on your config.

# Set the default command to start your Python application
CMD ["python3", "modules/main.py"]