# Use the official Python image as the base image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the Python program into the container
COPY hello.py .

# Run the Python program when the container starts
CMD ["python", "hello.py"]
