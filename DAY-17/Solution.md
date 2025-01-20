
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
