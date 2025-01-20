# 1.Theory Refresher

## Differences Between Virtual Machines and Containers

### Virtual Machines (VMs)
- **Definition**: A virtual machine is a software implementation of a physical computer that runs an operating system and applications just like a physical computer.
- **Isolation**: VMs provide isolation at the hardware level. Each VM runs a full copy of an operating system, the application, necessary binaries, and libraries.
- **Resource Usage**: VMs are resource-intensive because they include a full operating system and all the necessary binaries and libraries.
- **Boot Time**: VMs take longer to boot up because they need to load the entire operating system.
- **Use Cases**: Suitable for running multiple operating systems on a single physical machine, testing, and development environments.

### Containers
- **Definition**: A container is a lightweight, standalone, and executable package that includes everything needed to run a piece of software, including the code, runtime, system tools, libraries, and settings.
- **Isolation**: Containers provide isolation at the process level. They share the host system’s operating system kernel but run in isolated user spaces.
- **Resource Usage**: Containers are lightweight because they share the host system’s kernel and do not require a full operating system.
- **Boot Time**: Containers start up quickly because they do not need to load an entire operating system.
- **Use Cases**: Ideal for microservices architecture, continuous integration/continuous deployment (CI/CD) pipelines, and scaling applications.

## Why Are Containers Considered Lightweight Compared to VMs?

Containers are considered lightweight compared to VMs for several reasons:
- **Shared Kernel**: Containers share the host system’s operating system kernel, which reduces the overhead of running multiple operating systems.
- **Efficient Resource Utilization**: Containers use fewer resources because they do not require a full operating system for each instance.
- **Fast Startup**: Containers start up quickly because they do not need to boot an entire operating system.
- **Portability**: Containers can run consistently across different environments, making them highly portable.

## Docker Architecture

Docker uses a client-server architecture. The Docker client talks to the Docker daemon, which does the heavy lifting of building, running, and distributing Docker containers.

### Key Components of Docker Architecture

1. **Docker Client**: The command-line interface (CLI) that users interact with to run Docker commands.
2. **Docker Daemon**: The background service running on the host machine that listens for Docker API requests and manages Docker objects such as images, containers, networks, and volumes.
3. **Docker Registry**: A storage for Docker images. Docker Hub is a public registry that anyone can use, and Docker also supports private registries.
4. **Docker Images**: Read-only templates with instructions for creating a new container. Images are built from a Dockerfile.
5. **Docker Containers**: Run-time instances of Docker images. Containers are lightweight and include everything needed to run the application.
6. **Dockerfile**: A script containing a series of instructions on how to build a given Docker image.

## Docker's Key Components

### Images
- **Definition**: A Docker image is a read-only template that contains a set of instructions for creating a new container.
- **Usage**: Images are used to create containers. They include the application code, runtime, libraries, environment variables, and configuration files.
- **Example**: A Docker image for a Python application might include the Python runtime, application code, and dependencies.

### Containers
- **Definition**: A Docker container is a run-time instance of a Docker image.
- **Usage**: Containers are lightweight and include everything needed to run the application. They share the host system’s kernel but run in isolated user spaces.
- **Example**: A running instance of a Python application containerized using Docker.

### Registries
- **Definition**: A Docker registry is a storage and distribution system for Docker images.
- **Usage**: Registries allow you to store, distribute, and share Docker images. Docker Hub is a public registry, but you can also use private registries.
- **Example**: Docker Hub, AWS Elastic Container Registry (ECR), Google Container Registry (GCR).

### Dockerfile
- **Definition**: A Dockerfile is a script containing a series of instructions on how to build a given Docker image.
- **Usage**: Dockerfiles are used to automate the process of creating Docker images. They specify the base image, copy files, install dependencies, and set environment variables.
- **Example**:
  ```Dockerfile
  FROM python:3.9-slim
  WORKDIR /app
  COPY . /app
  RUN pip install --no-cache-dir -r requirements.txt
  EXPOSE 80
  CMD ["python", "app.py"]

  <img width="525" alt="image" src="https://github.com/user-attachments/assets/ba9d7f3d-f5d2-4e4e-b019-41d28bf87fa1" />



### 2. Hands-On Practice
   * Install Docker on your local machine or a virtual instance (if not already installed).
   * Run the official **nginx** Docker container:

```bash
docker run -d -p 8080:80 nginx
```
   * Access the running container via your browser at http://<your-ip>:8080.
   * Please list all running containers and look over the nginx container details.

<img width="577" alt="image" src="https://github.com/user-attachments/assets/d6fbb322-e944-4617-a07e-7ae52d01583d" />

<img width="1147" alt="image" src="https://github.com/user-attachments/assets/d0063f4b-d186-4edb-8394-d217880f6f9c" />

<img width="1034" alt="image" src="https://github.com/user-attachments/assets/13f7f65b-f680-43d9-ae08-59b213a1ca05" />


### 3. Deep Dive Exercise
   * Create a Dockerfile for a simple Python application that prints "Hello, Containers!" when run.
   * Build an image from your Dockerfile and run it as a container.
   * Share your Dockerfile and the output of the container in your submission.

<img width="844" alt="image" src="https://github.com/user-attachments/assets/2b39b9b9-dbd7-41ac-abee-5896ecc4b137" />

<img width="851" alt="image" src="https://github.com/user-attachments/assets/f9543915-9e94-4adc-bcfa-ce8559db59f1" />


<img width="788" alt="image" src="https://github.com/user-attachments/assets/f89fd384-ee0f-4084-a425-493e4d362827" />

<img width="641" alt="image" src="https://github.com/user-attachments/assets/967e75c2-2d44-42ff-be86-60e25a3ce944" />



### 4. Share your Docker image
   * Tag the Docker image you created for the Python application. Use the format:

```bash
<your-dockerhub-username>/<image-name>:<tag>
```

Example:
```bash
docker tag python-hello <your-dockerhub-username>/python-hello:v1
```
<img width="672" alt="image" src="https://github.com/user-attachments/assets/f21eed49-fff8-4f47-9a93-6699b7073be9" />

   * Push the tagged image to Docker Hub (or any container registry you prefer).
```bash
docker push <your-dockerhub-username>/python-hello:v1
```
<img width="772" alt="image" src="https://github.com/user-attachments/assets/df397291-6fed-43a5-ad48-49c297cf8c22" />

   * Share the public URL of your pushed image in the submission.
   * Repo link(Docker Hub): https://hub.docker.com/repository/docker/raihaniqbal131999/python-hello/general
