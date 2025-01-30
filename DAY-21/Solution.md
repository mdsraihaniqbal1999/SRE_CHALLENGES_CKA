# DevOps SRE Daily Challenge: Kubernetes Cluster Upgrades

## Hello Learners,

Welcome back to another thrilling episode of the **DevOps SRE Daily Challenge!** 🎉

In the world of Kubernetes, keeping your clusters up-to-date isn’t just a best practice—it’s essential for ensuring security, stability, and access to the latest features. For DevOps engineers, SREs, and Kubernetes certification candidates, mastering cluster upgrades across diverse environments is a critical skill.

Whether you’re managing clusters in local development environments, production-grade cloud infrastructures, or anything in between, understanding the nuances of different upgrade strategies will make you a Kubernetes pro!

---

## Why Cluster Upgrades Matter for Your Exam

### Real-World Relevance
Upgrading clusters is a routine task in production environments to patch vulnerabilities, improve performance, and enable new features. Understanding these processes prepares you for managing real-world Kubernetes workloads.

### Certification Preparation
Tasks related to version upgrades are commonly seen in certification exams like **CKA**. Being familiar with these workflows will save you valuable time during the test.

### Managed vs. Self-Hosted Clusters
Understanding the differences between upgrading **managed Kubernetes services like EKS** and **self-hosted clusters** is essential. Managed services often abstract some complexities but still require careful planning to ensure compatibility and performance. Self-hosted clusters offer more control but demand a deeper understanding of the upgrade process.

| Feature            | Managed Clusters (e.g., EKS, AKS, GKE) | Self-Hosted Clusters (e.g., Kubeadm, Kind) |
|-------------------|--------------------------------------|----------------------------------|
| **Upgrade Control** | Automated by cloud provider        | Manual control over versions    |
| **Complexity**    | Lower, as upgrades are simplified  | Higher, requires planning & execution |
| **Customization** | Limited                            | Full control over cluster settings |
| **Risk of Downtime** | Lower, as cloud providers handle failovers | Higher if not planned properly |
| **Security Updates** | Managed automatically            | Requires manual intervention |
| **Cost**          | May have extra costs for managed services | Typically lower but requires operational effort |

#### Best Practices:
- Always test upgrades in **staging** or **non-production environments** first.
- Backup your cluster and critical data before initiating any upgrade.
- Read the release notes carefully for deprecations and breaking changes.
- Automate where possible to ensure consistency and reduce human errors.

---

## Challenge Tasks and Step-by-Step Solutions

### **Theory Challenge: Understanding Cluster Upgrades**

#### Why Upgrade Clusters?
**Step 1:**
- Upgrading clusters ensures access to new features, security patches, and performance improvements.
- It prevents vulnerabilities that could be exploited by attackers.

**Step 2:**
- Running outdated versions may lead to compatibility issues with new workloads.
- Kubernetes deprecates older APIs, which can break applications relying on them.

#### Upgrade Strategies:
**Step 1:**
- **Rolling Upgrades**: Gradually replace old nodes with new ones while keeping the system operational.
- **Blue-Green Deployments**: A completely new version runs alongside the old one, allowing a quick rollback if needed.
- **Canary Deployments**: A subset of users gets the new version first before rolling out to the entire system.

**Step 2:**
- Choose a **Rolling Upgrade** for high availability.
- Use **Blue-Green Deployments** for critical workloads requiring zero downtime.

#### Managed vs. Self-Hosted Clusters:
**Step 1:**
- Managed clusters like **EKS, AKS, GKE** provide automated upgrades.
- Self-hosted clusters using **Kubeadm** require manual upgrades with more control.

**Step 2:**
- Managed clusters reduce complexity but may limit control over the process.
- Self-hosted clusters need careful planning to prevent downtime.

---

### **Practical Challenge: Upgrading Clusters in Different Environments**

#### **1. Minikube Cluster Upgrade**

**Step 1:** Check the current version:
```sh
minikube version
```

**Step 2:** Upgrade Minikube:
```sh
minikube stop
minikube delete
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

**Step 3:** Start Minikube and verify the upgrade:
```sh
minikube start
kubectl version --short
```

#### **2. Kind Cluster Upgrade**

**Step 1:** Create a cluster with an older version:
```sh
kind create cluster --name upgrade-cluster --image kindest/node:v1.30.8
```

**Step 2:** Verify the version:
```sh
kubectl --context kind-upgrade-cluster version --short
```

**Step 3:** Upgrade Kind and recreate the cluster:
```sh
kind delete cluster --name upgrade-cluster
kind create cluster --name upgrade-cluster --image kindest/node:v1.32.0
```

**Step 4:** Verify the new version:
```sh
kubectl --context kind-upgrade-cluster version --short
```

#### **3. Kubeadm Cluster Upgrade**

**Step 1:** Check current cluster version:
```sh
kubectl version --short
```

**Step 2:** Upgrade kubeadm:
```sh
sudo apt-get update && sudo apt-get install -y kubeadm
sudo kubeadm upgrade plan
sudo kubeadm upgrade apply v1.32.0
```

**Step 3:** Upgrade kubelet and restart services:
```sh
sudo apt-get install -y kubelet
sudo systemctl restart kubelet
```

**Step 4:** Verify upgrade:
```sh
kubectl get nodes
kubectl version --short
```

#### **4. EKS Cluster Upgrade**

**Step 1:** Check the current version:
```sh
aws eks describe-cluster --name my-cluster --query "cluster.version" --output text
```

**Step 2:** Upgrade control plane:
```sh
aws eks update-cluster-version --name my-cluster --kubernetes-version 1.32
```

**Step 3:** Upgrade node groups:
```sh
aws eks update-nodegroup-version --cluster-name my-cluster --nodegroup-name my-nodegroup
```

**Step 4:** Verify upgrade:
```sh
kubectl version --short
kubectl get nodes -o wide
```

---

## **Submission Guidelines**

### Your submission should include:
- **Your answers to the theory questions.**
- **Screenshots of:**
  - The pre-upgrade and post-upgrade versions for each cluster.
  - Key commands executed during the upgrade process.
- **Document your observations and challenges during the upgrades.**
- **Post your progress with the hashtags:** `#KubernetesUpgrades`, `#DevOpsForAll`, `#ckawithsagar`

---

## **Resources to Help You**

- [Minikube Upgrade Documentation](https://minikube.sigs.k8s.io/docs/start/)
- [Kind Cluster Guide](https://kind.sigs.k8s.io/)
- [Kubeadm Upgrade Guide](https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/)
- [YouTube: Kubeadm Upgrades](https://www.youtube.com/results?search_query=kubeadm+upgrade)
- [EKS Cluster Upgrade Documentation](https://docs.aws.amazon.com/eks/latest/userguide/update-cluster.html)

If you missed any previous challenges, you can catch up by reviewing the problem statements on GitHub.

**Best regards,**  
*Sagar Utekar*

