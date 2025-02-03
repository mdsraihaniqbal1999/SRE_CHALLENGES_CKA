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

# Practical Challenge: Upgrading Clusters in Different Environments

## 1. Minikube Cluster Upgrade
* Upgrade your existing Minikube setup to the latest version.
* Verify that the Kubernetes version in the cluster matches the latest stable release.
<img width="365" alt="image" src="https://github.com/user-attachments/assets/aaf720b0-4a4b-40ad-8800-c53c0112760d" />

<br/>

<img width="355" alt="image" src="https://github.com/user-attachments/assets/2e44822d-c00b-4723-96bf-77612e2b0816" />

<br/>

<img width="472" alt="image" src="https://github.com/user-attachments/assets/655b313d-c0f5-4057-9c1b-3ac0104327ff" />

<br/>

<img width="979" alt="image" src="https://github.com/user-attachments/assets/d8fc17fc-2efe-40e9-b642-92d2f5c59c12" />

<br/>

<img width="1152" alt="image" src="https://github.com/user-attachments/assets/6236e385-6734-43ee-8a54-7ce22d40707c" />

<br/>

<img width="787" alt="image" src="https://github.com/user-attachments/assets/039a35af-0bd8-4f45-ae42-8bfe3a34c4e6" />

<br/>

<img width="1127" alt="image" src="https://github.com/user-attachments/assets/07131d2d-2bb0-43a2-b8e4-25ca7ff613a3" />

<br/>


<img width="1152" alt="image" src="https://github.com/user-attachments/assets/efd48b0d-4545-4d9a-97b9-dbc086c1e6f5" />

<br/>

<img width="399" alt="image" src="https://github.com/user-attachments/assets/1fec4037-55a6-4242-ad38-d848906ad277" />

<br/>

<img width="630" alt="image" src="https://github.com/user-attachments/assets/72e1dc10-fd95-40f5-aeb5-1f077651461a" />

<br/>

## 2. Kind Cluster Upgrade
* Create a Kind cluster using an older Kubernetes version (e.g., v1.30.8).
* Upgrade kind cluster to latest version
* Confirm the version upgrade with `kubectl version`.

<img width="903" alt="image" src="https://github.com/user-attachments/assets/4ddfad0d-924a-4698-9446-34bf5567d5c4" />
<br/>
<img width="963" alt="image" src="https://github.com/user-attachments/assets/1ae6a177-c972-4855-bd29-2816b860bc42" />
<br/>
<img width="448" alt="image" src="https://github.com/user-attachments/assets/006f32f6-17fb-48ba-bce7-7e715cd3581a" />
<br/>
<img width="1143" alt="image" src="https://github.com/user-attachments/assets/ed5d7538-b847-4620-8e82-aa9e6e6b709b" />
<br/>
<img width="1152" alt="image" src="https://github.com/user-attachments/assets/1824c025-888f-4302-abc5-a83e1dc82267" />
<br/>
<img width="613" alt="image" src="https://github.com/user-attachments/assets/53b67bde-3820-4cc2-a117-bac5519fa1d6" />
<br/>
<img width="1000" alt="image" src="https://github.com/user-attachments/assets/b08ad36e-ebc3-4bcf-92b4-bd14545521b0" />
<br/>
<img width="953" alt="image" src="https://github.com/user-attachments/assets/1cc434c3-f945-41bd-b0dd-faccd3a5c148" />










## 3. Kubeadm Cluster Upgrade
* Create a multi-node Kubernetes cluster using Kubeadm.
* Upgrade the Control Plane and Nodes to a newer Kubernetes version.
* Verify that all components (kube-apiserver, kube-controller-manager, kube-scheduler, etc.) are updated.

### Resources:
* Kubeadm Upgrade Documentation
* Kubeadm Cluster Upgrade Guide
* YouTube Video on Kubeadm Upgrades

## 4. EKS Cluster Upgrade
* Upgrade the EKS Control Plane to a newer version using AWS CLI.
* Update the node groups to match the Control Plane version.
* Confirm the upgrade with `kubectl version`.

**Note:** EKS also provides an **auto mode** for node groups, which simplifies the process of keeping your nodes up-to-date. While this reduces manual intervention, it's important to monitor the process and validate workloads after the upgrade to ensure seamless transitions.

## Best Practices:
* Monitor your workloads during the upgrade to ensure there are no disruptions.
* Use a phased approach to minimize risks in production.
* Leverage EKS version release notes and upgrade tools to plan your upgrades effectively.

## Submission Guidelines
1. Your answers to the theory questions.
2. Screenshots of:
   * The pre-upgrade and post-upgrade versions for each cluster.
   * Key commands executed during the upgrade process.
3. Document your observations and challenges during the upgrades.
4. Post your progress with the hashtags: #KubernetesUpgrades, #DevOpsForAll, #ckawithsagar

