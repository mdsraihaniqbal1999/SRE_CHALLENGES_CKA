
### 1. Theory Refresher
   * Could you explain in your own words the difference between virtual machines and containers?
   * Why are containers considered lightweight compared to VMs?
   * Explain Docker Architecture
   * What are Docker's key components (e.g., images, containers, registries)?

### 2. Hands-On Practice
   * Install Docker on your local machine or a virtual instance (if not already installed).
   * Run the official **nginx** Docker container:

```bash
docker run -d -p 8080:80 nginx
```
   * Access the running container via your browser at http://<your-ip>:8080.
   * Please list all running containers and look over the nginx container details.

### 3. Deep Dive Exercise
   * Create a Dockerfile for a simple Python application that prints "Hello, Containers!" when run.
   * Build an image from your Dockerfile and run it as a container.
   * Share your Dockerfile and the output of the container in your submission.

### 4. Share your Docker image
   * Tag the Docker image you created for the Python application. Use the format:

```bash
<your-dockerhub-username>/<image-name>:<tag>
```

Example:
```bash
docker tag python-hello <your-dockerhub-username>/python-hello:v1
```
   * Push the tagged image to Docker Hub (or any container registry you prefer).
```bash
docker push <your-dockerhub-username>/python-hello:v1
```
   * Share the public URL of your pushed image in the submission.
