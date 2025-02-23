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
2. **Access and review the configurations of the following components:**
   - API Server, Scheduler, Controller Manager, etcd
   - Kubelet, Kube Proxy, Container runtime


3. **Check the configuration files in:**
   - `/etc/kubernetes/manifests/`
   - `/var/lib/kubelet/config.yaml`
  <img width="599" alt="image" src="https://github.com/user-attachments/assets/4faa42a0-88d7-439d-9580-1e3cb0b14375" />
<img width="601" alt="image" src="https://github.com/user-attachments/assets/cd55b06e-6907-4a49-baff-d905720908fa" />
<img width="538" alt="image" src="https://github.com/user-attachments/assets/d12b92e0-1227-4f20-a6b0-fbd54e085b77" />
<img width="602" alt="image" src="https://github.com/user-attachments/assets/9c9b1e65-b92b-4e06-a104-ead04770b9ce" />





4. **Retrieve logs for the components**
5. **Identify the ports used by the components for communication:**
   - Use `kubectl` to inspect pod logs:
   - Use `crictl` for container management:
     - List all containers
     - Inspect details of a specific container
     - Check logs of a specific container

### Bonus Task
Use the command `kubectl cluster-info dump` in both Minikube and Kubeadm setups.
Share insights on the diagnostic information retrieved, including any unusual configurations or observations.

## Submission Guidelines
Submit the following:
- Explanation of Kubernetes fundamentals based on the theory section.
- Screenshots of component configurations and logs from both Minikube and Kubeadm setups.
- Port mapping and explanations.
- Logs from `kubectl` and `crictl` commands.
- The cluster detective's report: Any insights you found while investigating the clusters.
