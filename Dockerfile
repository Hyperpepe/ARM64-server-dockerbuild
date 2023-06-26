# Use an ARM-compatible base image
FROM arm64v8/python:3.8-bullseye

# Set the working directory
WORKDIR /app

# Copy requirements.txt into the container
COPY requirements.txt .

# Upgrade pip and install dependencies
RUN apt-get update && \
    apt-get install -y gcc python3-dev libgl1-mesa-glx libglib2.0-0 libsm6 libxrender1 libxext6 libgtk2.0-dev  && \
#    apt-get install -y net-tools && \
    pip install --no-cache-dir --prefer-binary -r requirements.txt

RUN pip install flask

RUN pip install PyYAML

RUN pip install cryptography

RUN apt-get install nano

RUN apt-get install net-tools
