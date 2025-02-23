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
<img width="566" alt="image" src="https://github.com/user-attachments/assets/e5fba5c2-8612-4351-93ee-d2331bca216d" />
<img width="603" alt="image" src="https://github.com/user-attachments/assets/a8fd3546-fee5-405f-a8c7-0ace99b44f2b" />
<img width="593" alt="image" src="https://github.com/user-attachments/assets/cc66d28c-6ceb-4f91-89ad-8ea376d1ebfb" />
<img width="557" alt="image" src="https://github.com/user-attachments/assets/3604354b-a5a9-412a-ba17-9bc939fcbc1d" />
<img width="602" alt="image" src="https://github.com/user-attachments/assets/7f8fbf97-7c80-4a1f-badb-748e1c2295b1" />
4. **Retrieve logs for the components**
<img width="619" alt="image" src="https://github.com/user-attachments/assets/c89a9f29-31d3-40bd-ae2e-9b8f3d9f36c0" />
<img width="599" alt="image" src="https://github.com/user-attachments/assets/01e506c6-174b-4826-a761-a65f71af92e6" />
<img width="598" alt="image" src="https://github.com/user-attachments/assets/b3c90b4c-b836-4a39-8d2a-853e878a7c91" />
<img width="608" alt="image" src="https://github.com/user-attachments/assets/9bd0ee9c-edd9-45d7-8b57-a9569539d40b" />
<img width="596" alt="image" src="https://github.com/user-attachments/assets/eb71db1a-198e-401e-9db4-9090db421e9a" />


6. **Identify the ports used by the components for communication:**
   - Use `kubectl` to inspect pod logs:
   - Use `crictl` for container management:
     - List all containers
     - Inspect details of a specific container
     - Check logs of a specific container
    
     <img width="627" alt="image" src="https://github.com/user-attachments/assets/34af8188-feed-4d63-a397-870a3a126e4d" />
<img width="624" alt="image" src="https://github.com/user-attachments/assets/49a3f99d-2d43-47df-9dff-24fc1beb5737" />
<img width="601" alt="image" src="https://github.com/user-attachments/assets/f6e91184-4749-4401-b6d2-0ee48b5b34a5" />
<img width="601" alt="image" src="https://github.com/user-attachments/assets/b09e633f-fbc0-432c-96f0-388a6aa5df90" />
<img width="599" alt="image" src="https://github.com/user-attachments/assets/338b9ece-60b5-496b-b5ae-7429872eff37" />


### Bonus Task
Use the command `kubectl cluster-info dump` in both Minikube and Kubeadm setups.
Share insights on the diagnostic information retrieved, including any unusual configurations or observations.
<img width="598" alt="image" src="https://github.com/user-attachments/assets/38d65940-79e6-423b-8c19-e8f487cf2f8a" />


## Submission Guidelines
Submit the following:
- Explanation of Kubernetes fundamentals based on the theory section.
- Screenshots of component configurations and logs from both Minikube and Kubeadm setups.
- Port mapping and explanations.
- Logs from `kubectl` and `crictl` commands.
- The cluster detective's report: Any insights you found while investigating the clusters.
