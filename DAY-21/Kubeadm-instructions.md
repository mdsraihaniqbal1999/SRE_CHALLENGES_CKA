# Kubernetes Cluster Upgrade Guide
> A comprehensive guide for upgrading Kubernetes cluster from v1.31.5 to v1.32.0

## Overview
This guide provides step-by-step instructions for upgrading a Kubernetes cluster from version 1.31.5 to 1.32.0. The process follows the recommended practice of upgrading the control plane node first, followed by worker nodes, ensuring minimal disruption to cluster operations.

## Prerequisites

### SSH Access and Root Privileges
1. Login to all nodes via SSH
2. Switch to root user:
   ```bash
   sudo su
   ```

### Node Preparation
Execute these steps on **all nodes** (control plane and workers):

1. Disable swap:
   ```bash
   swapoff -a
   sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
   ```

2. Update package repository:
   ```bash
   vi /etc/apt/sources.list.d/kubernetes.list
   ```
   Add the following line:
   ```
   deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /
   ```

3. Update package lists:
   ```bash
   sudo apt update
   ```

4. Check available kubeadm versions:
   ```bash
   sudo apt-cache madison kubeadm
   ```

## Control Plane Upgrade

1. Upgrade kubeadm:
   ```bash
   sudo apt-mark unhold kubeadm && \
   sudo apt-get update && sudo apt-get install -y kubeadm='1.32.0-1.1' && \
   sudo apt-mark hold kubeadm
   ```

2. Apply the upgrade:
   ```bash
   sudo kubeadm upgrade apply v1.32.0-1.1
   ```

3. Drain the control plane node:
   ```bash
   kubectl drain controlplane --ignore-daemonsets
   ```

4. Upgrade kubelet and kubectl:
   ```bash
   sudo apt-mark unhold kubelet kubectl && \
   sudo apt-get update && sudo apt-get install -y kubelet='1.32.0-1.1' kubectl='1.32.0-1.1' && \
   sudo apt-mark hold kubelet kubectl
   ```

5. Restart and verify services:
   ```bash
   sudo systemctl daemon-reload
   sudo systemctl restart kubelet
   sudo systemctl status kubelet
   ```
   
   If errors occur:
   ```bash
   journalctl -xeu kubelet
   ```

6. Make the node schedulable:
   ```bash
   kubectl uncordon controlplane
   ```

## Worker Nodes Upgrade

Execute these steps for **each worker node**:

1. Update repository:
   ```bash
   vi /etc/apt/sources.list.d/kubernetes.list
   ```
   Add:
   ```
   deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /
   ```

2. Update and check versions:
   ```bash
   sudo apt update
   sudo apt-cache madison kubeadm
   ```

3. Upgrade kubeadm:
   ```bash
   sudo apt-mark unhold kubeadm && \
   sudo apt-get update && \
   sudo apt-get install -y kubeadm=1.32.0-1.1 && \
   sudo apt-mark hold kubeadm
   ```

4. Upgrade node configuration:
   ```bash
   sudo kubeadm upgrade node
   ```

5. Drain worker node (run on control plane):
   ```bash
   kubectl drain <worker-node-name> --ignore-daemonsets
   ```

6. Upgrade kubelet and kubectl:
   ```bash
   sudo apt-mark unhold kubelet kubectl && \
   sudo apt-get update && sudo apt-get install -y kubelet='1.32.0-1.1' kubectl='1.32.0-1.1' && \
   sudo apt-mark hold kubelet kubectl
   ```

7. Restart services:
   ```bash
   sudo systemctl daemon-reload
   sudo systemctl restart kubelet
   sudo systemctl status kubelet
   ```

   If errors occur:
   ```bash
   journalctl -xeu kubelet
   ```

8. Make worker node schedulable (run on control plane):
   ```bash
   kubectl uncordon <worker-node-name>
   ```

## Verification

After completing all steps, verify the upgrade:
```bash
kubectl get nodes
```

The output should show all nodes running version v1.32.0.

