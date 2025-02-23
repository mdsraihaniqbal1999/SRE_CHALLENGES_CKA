## Challenge Tasks

### The Kubernetes Detective Theory Challenge:
To solve the case, you must gather all the facts. Here's your first clue:

#### What is Kubernetes?
- Define Kubernetes and explain its purpose in the world of container orchestration.
- Highlight the problems Kubernetes solves (e.g., scaling, fault tolerance, declarative management).

#### Features of Kubernetes:
- List and briefly explain features like scalability, self-healing, service discovery, storage orchestration, automated rollouts/rollbacks, etc.

#### Kubernetes Architecture:
- Illustrate the architecture with two main sections:
  - **Control Plane Components**: API Server, etcd, Scheduler, Controller Manager.
  - **Worker Node Components**: Kubelet, Kube Proxy, Container Runtime.
- Explain the role of each component in maintaining cluster functionality.

#### Configuration Files and Logs:
- Discuss where configuration files for these components are located and why they’re essential for debugging.

#### Ports Used:
- List the ports used by control plane and worker node components for communication (e.g., API server port 6443).

### Practical: Solving the Cluster Mystery
Your investigation continues with Minikube — a single-node Kubernetes setup and for a multi-node Kubernetes setup using Kubeadm.

Here’s what to do:

1. **Use your existing clusters from the previous challenge.**
<img width="587" alt="image" src="https://github.com/user-attachments/assets/1cf238d0-a337-41e2-af88-ae85d5fdfaf5" />
<img width="576" alt="image" src="https://github.com/user-attachments/assets/60ec2bff-2b19-4d90-9e72-f373ef5a7159" />


2. **Access and review the configurations of the following components:**
   - API Server, Scheduler, Controller Manager, etcd
   - Kubelet, Kube Proxy, Container runtime
  <img width="589" alt="image" src="https://github.com/user-attachments/assets/3aec4445-b9b2-475a-a4d3-524022848441" />

4. **Check the configuration files in:**
   - `/etc/kubernetes/manifests/`
     <img width="593" alt="image" src="https://github.com/user-attachments/assets/e93daaae-ff42-469a-8048-1b9f14b259f4" />

   - `/var/lib/kubelet/config.yaml`
<img width="577" alt="image" src="https://github.com/user-attachments/assets/9f6ef067-ec55-4cb6-ba5a-b34987dce93c" />

5. **Retrieve logs for the components**
<img width="601" alt="image" src="https://github.com/user-attachments/assets/ded9ffec-43e3-4a9d-92fe-d2f81586def8" />
<img width="368" alt="image" src="https://github.com/user-attachments/assets/3900442d-9f32-4cc0-b3f8-eea8b2792776" />
<img width="602" alt="image" src="https://github.com/user-attachments/assets/f606e3e1-659b-4a50-980b-b0d17379a10f" />
<img width="602" alt="image" src="https://github.com/user-attachments/assets/cb834598-10d5-496a-b2d7-5b8f22482bfc" />
<img width="638" alt="image" src="https://github.com/user-attachments/assets/b5843924-4000-4961-8f0e-112087658172" />
<img width="605" alt="image" src="https://github.com/user-attachments/assets/bf514a39-17c0-46d5-a7ee-7b10845a3ab0" />
<img width="370" alt="image" src="https://github.com/user-attachments/assets/d850aeff-704a-463e-8c02-2849ff9db181" />
<img width="628" alt="image" src="https://github.com/user-attachments/assets/b488876a-275a-4e57-bc41-864d63c30f9b" />
<img width="626" alt="image" src="https://github.com/user-attachments/assets/32d3d132-a5ee-4212-89b4-ffb77b40a6ff" />



6. **Identify the ports used by the components for communication:**
   - Use `kubectl` to inspect pod logs:
   - Use `crictl` for container management:
     - List all containers
     - Inspect details of a specific container
     - Check logs of a specific container

<img width="600" alt="image" src="https://github.com/user-attachments/assets/983a1a1e-ac2a-498a-a05d-8c62e103d954" />
<img width="612" alt="image" src="https://github.com/user-attachments/assets/a919fce2-be94-4a72-a893-f45d87d380ad" />
<img width="599" alt="image" src="https://github.com/user-attachments/assets/919ee6f2-0eba-4a80-9d02-48f0ded6526d" />
<img width="604" alt="image" src="https://github.com/user-attachments/assets/5b421e50-7a12-4491-b19d-50951da64660" />
<img width="601" alt="image" src="https://github.com/user-attachments/assets/a270dabd-1bdd-434c-b408-b6a63b834ea7" />
<img width="597" alt="image" src="https://github.com/user-attachments/assets/90a8724d-ed5b-4f95-9fea-504d1f59e143" />
<img width="621" alt="image" src="https://github.com/user-attachments/assets/647dd08c-c601-48f1-8882-1d74011e0cb9" />



### Bonus Task
Use the command `kubectl cluster-info dump` in both Minikube and Kubeadm setups.
Share insights on the diagnostic information retrieved, including any unusual configurations or observations.
![Uploading image.png…]()


## Submission Guidelines
Submit the following:
- Explanation of Kubernetes fundamentals based on the theory section.
- Screenshots of component configurations and logs from both Minikube and Kubeadm setups.
- Port mapping and explanations.
- Logs from `kubectl` and `crictl` commands.
- The cluster detective's report: Any insights you found while investigating the clusters.
