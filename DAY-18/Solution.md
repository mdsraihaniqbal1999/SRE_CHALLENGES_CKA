## Challenge Tasks

### 1. Minikube Setup
   * Install Minikube on your system (Windows/Linux/Mac). Reference: Minikube Installation Guide
   * Start a Minikube cluster and verify its status:

```bash
minikube start
minikube status
```
<img width="338" alt="image" src="https://github.com/user-attachments/assets/9dba47a9-206c-4065-b225-7bf2e6d99efd" />

<img width="900" alt="image" src="https://github.com/user-attachments/assets/ee1a8d58-16c1-4a16-91bc-940392c541e6" />

<img width="1028" alt="image" src="https://github.com/user-attachments/assets/24e1ce12-8dfe-4d03-8adf-b8c72e836815" />

<img width="525" alt="image" src="https://github.com/user-attachments/assets/86dc303b-1f9e-493b-b78f-15113e6e5d1b" />


   * List all available nodes in the cluster:

```bash
kubectl get nodes
```
<img width="525" alt="image" src="https://github.com/user-attachments/assets/655c53cc-1404-4f4a-9b33-3b2b83e0a0cc" />


   * Share the output of `kubectl get nodes` in your submission.

### 2. Kubeadm Cluster Setup
   * Use **Kubeadm** to set up a 3-node Kubernetes cluster (1 control-plane, 2 nodes). Reference: Kubeadm Kubernetes Cluster Setup
   * Key steps include:
      * Setting up prerequisites (e.g., container runtime, kubelet, kubeadm, kubectl).
      * Initializing the control plane using `kubeadm init`.
      * Joining a node to the cluster using the `kubeadm join` command.
   * Verify the cluster setup with:

```bash
kubectl get nodes
```

   * Share screenshots of the control-plane and node status.

### 3. Theory Comparison
   * Write a brief explanation comparing Minikube and Kubeadm setups. Address the following:
      * Use cases for Minikube vs. Kubeadm.
      * How they differ in cluster complexity and purpose.

## Bonus Task
* Install and enable the Kubernetes dashboard on your Kubernetes cluster.
* Access the dashboard and share a screenshot.

## Submission Guidelines
* Include:
   * Outputs of `kubectl get nodes` for both Minikube and Kubeadm setups.
   * Screenshots showing the successful cluster setup.
   * Minikube vs. Kubeadm comparison
* Post your experience on social media with the hashtags: #getfitwithsagar, #SRELife, #DevOpsForAll #ckawithsagar
