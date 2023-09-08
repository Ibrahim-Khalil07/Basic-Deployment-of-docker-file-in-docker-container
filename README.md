# Hello Python Docker CI/CD with GitLab

Creating basic Python program that is deployed using Docker and GitLab CI/CD. The program simply prints "Hello, World!" when run. And container is created from container file

## Task Overview

The goal of this project is to set up a CI/CD pipeline using GitLab to automate the building and deployment of a Dockerized Python application. The key steps involved in completing this task are as follows:

### Steps to Complete the Task

1. **Create a GitLab Repository:**

   - Create a new GitLab repository to host your Python application and CI/CD configuration.

2. **Write a Python Program:**

   - Develop a simple Python program (e.g., `hello.py`) that performs a specific task. In this case, we're using a program that prints "Hello, World!".

3. **Create a Dockerfile:**

   - Write a Dockerfile (e.g., `Dockerfile`) to define how your Python application should be packaged into a Docker image. Specify any required dependencies and configurations.

4. **Set Up GitLab CI/CD:**

   - Create a `.gitlab-ci.yml` file in your repository to define the CI/CD pipeline. Configure stages and jobs for building and deploying the Docker image.

5. **Push Code to GitLab:**

   - Commit and push your Python program, Dockerfile, and `.gitlab-ci.yml` to your GitLab repository.

6. **Monitor the Pipeline:**

   - GitLab CI/CD will automatically trigger when changes are pushed to the `master` branch. Monitor the pipeline's progress and check for any issues.

7. **Resolve Issues (if any):**

   - If you encounter any issues during the pipeline, troubleshoot and make necessary adjustments to your code or CI/CD configuration. Common issues might include Dockerfile location, authentication errors, or Docker configuration problems.

8. **Review the Deployment:**

  - Once the pipeline successfully completes, review the deployment. BBy moving in the deployment section Deploy -> Container Registery -> There you will find your container

# Deployment

### Step 1: Create a Python Program

Let's start by creating a simple Python program. In this example, we'll create a program that prints "Hello, World!" when run.

// hello.py

print("Hello, Docker!")

### Step 2: Create a Dockerfile

Next, create a Dockerfile to build a Docker image for your Python program. This file contains instructions for Docker on how to build the image.

// Use the official Python image as the base image

FROM python:3.8-slim

// Set the working directory in the container

WORKDIR /app

// Copy the Python program into the container

COPY hello.py .

// Run the Python program when the container starts

CMD ["python", "hello.py"]

### Step 3: Build and Push the Docker Image

To build and push the Docker image to Docker Hub, follow these steps:

Install Docker on your local machine if you haven't already.

Open a terminal and navigate to the directory containing your Dockerfile and hello.py.

Build the Docker image using the following command, replacing <your-dockerhub-username> with your Docker Hub username and <image-name> with the desired image name:

#### docker build -t <your-dockerhub-username>/<image-name>:latest .

Once the image is built, push it to Docker Hub:


#### docker login -u <your-dockerhub-username>
#### docker push <your-dockerhub-username>/<image-name>:latest

### Step 4: Set Up GitLab CI/CD

To deploy your Docker image via GitLab CI/CD, you'll need a .gitlab-ci.yml file in your project's repository. Here's a basic example:

image: docker:19.03.12

services:
  - docker:19.03.12-dind

stages:
  - deploy

variables:

  CONTAINER_TEST_IMAGE: $CI_REGISTRY_IMAGE:latest

build_job:

  stage: deploy

  script:

    - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
    - docker build -t $CONTAINER_TEST_IMAGE -f Dockerfile .
    - docker push $CONTAINER_TEST_IMAGE
    - docker logout


Make sure to replace <your-dockerhub-username> and <image-name> with your Docker Hub username and image name.


Push your changes to the master branch of this GitLab repository.

Monitor the CI/CD pipeline on GitLab. It will automatically deploy the Docker image to a container.
### Video Demonstration

You can watch a video demonstration of this project on [YouTube](https://youtu.be/AR29V1wWjjk).


### Problems Faced During This Task

#### Docker Build Issue

- **Problem:** During the CI/CD pipeline, I encountered an issue where Docker was unable to locate the Dockerfile, resulting in an error: "unable to prepare context: unable to evaluate symlinks in Dockerfile path."

- **Solution:** I resolved this issue by ensuring that the Dockerfile was located in the root directory of the repository and correctly specifying its location in the `.gitlab-ci.yml` file using the `-f` flag.

#### Docker Login Error

- **Problem:** Another challenge I faced was an error related to Docker login during the CI/CD pipeline. The error message indicated a problem with connecting to Docker: "error during connect: Post 'http://docker:2375/v1.24/auth'."

- **Solution:** I addressed this issue by verifying that Docker was properly configured and running on the GitLab Runner, ensuring that the GitLab Runner's Docker service was configured correctly, and adjusting the Docker socket binding in the GitLab Runner's configuration.

### Learning Outcomes

Through this task, I gained valuable experience in setting up a CI/CD pipeline using GitLab, Docker, and Python. I learned:

- How to automate the building and deployment of Docker containers upon code changes.
- The importance of CI/CD variables for securely accessing external resources (e.g., Docker Hub).
- Troubleshooting skills for resolving common issues encountered during the CI/CD process.
- How to configure GitLab Runner for Docker-based CI/CD.

### Conclusion

This project demonstrates a basic CI/CD setup using GitLab, Docker, and a Python program. It showcases how to build, push, and deploy Docker containers automatically upon code changes, along with troubleshooting solutions for common issues faced during the process.

