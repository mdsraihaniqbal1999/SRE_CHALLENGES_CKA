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

<img width="339" alt="image" src="https://github.com/user-attachments/assets/3bc27b37-daae-4355-825b-976260e564f3" />
<br/>
<img width="409" alt="image" src="https://github.com/user-attachments/assets/3f35bbf8-1ccf-43ae-bd70-712685c1d8e0" />
<br/>
<img width="901" alt="image" src="https://github.com/user-attachments/assets/6a7ce587-f89a-4543-a5a4-fb2c819f60ae" />
<br/>
<img width="430" alt="image" src="https://github.com/user-attachments/assets/c1a4918e-8298-46a1-b229-0825c27aab3e" />
<br/>
<img width="366" alt="image" src="https://github.com/user-attachments/assets/e7412071-68a9-4b58-a9b9-e2ef7ff41b6f" />
<br/>
<img width="350" alt="image" src="https://github.com/user-attachments/assets/cccc8ee3-42dc-4ee8-bed0-1b11cc89c899" />

<br/>
<img width="536" alt="image" src="https://github.com/user-attachments/assets/a8d56460-60e4-4b36-b211-db513b61422b" />
<br/>
<img width="397" alt="image" src="https://github.com/user-attachments/assets/b499b805-f342-4b77-8db9-39e6791a7b1c" />
<br/>



## 3. Kubeadm Cluster Upgrade
* Create a multi-node Kubernetes cluster using Kubeadm.
* Upgrade the Control Plane and Nodes to a newer Kubernetes version.
* Verify that all components (kube-apiserver, kube-controller-manager, kube-scheduler, etc.) are updated.

<img width="661" alt="image" src="https://github.com/user-attachments/assets/e2430df8-14c2-4195-b286-0741a886f58d" />
<br/>
<img width="413" alt="image" src="https://github.com/user-attachments/assets/0c43cbec-fc22-471e-b6c5-ad937f293150" />
<br/>
<img width="338" alt="image" src="https://github.com/user-attachments/assets/f5043d48-7789-42c5-b7e3-b87f75f4381f" />
<br/>
<img width="408" alt="image" src="https://github.com/user-attachments/assets/49a75c61-f817-4e9c-9fb9-10f8dd97bcc1" />
<br/>
<img width="692" alt="image" src="https://github.com/user-attachments/assets/0e94d151-d4f9-43b8-9c8a-a31029a9302c" />
<br/>
<img width="293" alt="image" src="https://github.com/user-attachments/assets/9eef5624-8432-43b7-b7ee-3b38f91eafa9" />
<br/>
<img width="303" alt="image" src="https://github.com/user-attachments/assets/67062725-6ecf-4705-9ede-dc86352d9b17" />
<br/>
<img width="766" alt="image" src="https://github.com/user-attachments/assets/cc0ab53b-9a38-4c08-834a-3c307a19d343" />
<br/>
<img width="849" alt="image" src="https://github.com/user-attachments/assets/36d95375-68a7-4288-943a-284287081f31" />
<br/>
<img width="836" alt="image" src="https://github.com/user-attachments/assets/77003575-089a-4e5d-bfff-76038304a5ef" />
<br/>
<img width="901" alt="image" src="https://github.com/user-attachments/assets/55f36f46-90e9-45fd-9fef-ba84cd7dd328" />
<br/>
<img width="880" alt="image" src="https://github.com/user-attachments/assets/ce461c52-9cf5-4a3a-8844-c88d8d435e21" />
<br/>
<img width="871" alt="image" src="https://github.com/user-attachments/assets/e5fef2a7-a18e-47e0-95e3-992ef09d19ec" />
<br/>
<img width="631" alt="image" src="https://github.com/user-attachments/assets/a4400340-d181-4442-99f6-1868ed32ffee" />
<br/>
<img width="626" alt="image" src="https://github.com/user-attachments/assets/b187efdd-23f5-4026-bd0a-62765f60c5bd" />
<br/>
<img width="594" alt="image" src="https://github.com/user-attachments/assets/54b43fd5-5bdc-4450-a247-82e73180e8de" />
<br/>
<img width="955" alt="image" src="https://github.com/user-attachments/assets/6d18303f-10cf-4984-8199-de57fd88bc59" />
<br/>
<img width="1147" alt="image" src="https://github.com/user-attachments/assets/edb30144-4857-442a-bcb8-b384359feeed" />
<br/>
<img width="1025" alt="image" src="https://github.com/user-attachments/assets/39cd880c-cfdf-49d0-b87e-db7e63673986" />
<br/>
<img width="997" alt="image" src="https://github.com/user-attachments/assets/bffcf0e4-8d37-4f57-afb7-e00d99d6e133" />
<br/>
<img width="745" alt="image" src="https://github.com/user-attachments/assets/1519cc90-8187-414f-8991-2899d6c3cb60" />
<br/>
<img width="490" alt="image" src="https://github.com/user-attachments/assets/d221442c-5fcc-4fd7-9e31-37ee697fa4a6" />
<br/>
<img width="789" alt="image" src="https://github.com/user-attachments/assets/eeb3167d-8208-451d-9452-e81b10de064c" />
<br/>
<img width="580" alt="image" src="https://github.com/user-attachments/assets/44cec36a-5b77-4b51-8f62-8d2661937029" />
<br/>
<img width="1152" alt="image" src="https://github.com/user-attachments/assets/729f9fcf-ced0-4772-ae83-fffc0b9ca7a9" />
<br/>
<img width="578" alt="image" src="https://github.com/user-attachments/assets/61cc4841-49bd-4732-9765-412fbdadc462" />
<br/>
<img width="536" alt="image" src="https://github.com/user-attachments/assets/a020b575-ef75-48c3-b8f9-c05a26f0d9ed" />
<br/>
<img width="1152" alt="image" src="https://github.com/user-attachments/assets/e893eedc-1932-4483-b118-bb78f31f8f66" />
<br/>
<img width="889" alt="image" src="https://github.com/user-attachments/assets/f6271b8b-51f3-457f-9326-9761b84dbdb2" />
<br/>
<img width="584" alt="image" src="https://github.com/user-attachments/assets/b7f05349-95fe-4987-af57-4cd98723e70f" />
<br/>
<img width="1152" alt="image" src="https://github.com/user-attachments/assets/26cce50e-2204-4cfb-8121-0aad20162b3e" />
<br/>

<img width="912" alt="image" src="https://github.com/user-attachments/assets/58cd747d-e895-47db-9f38-e053c14bc288" />
<br/>
<img width="1141" alt="image" src="https://github.com/user-attachments/assets/58d07abe-4017-4f92-8fcb-34afc2740152" />
<br/>

<img width="1132" alt="image" src="https://github.com/user-attachments/assets/56385719-5fc1-450e-8167-7fd57056f695" />
<br/>
<img width="603" alt="image" src="https://github.com/user-attachments/assets/67987377-7c49-4747-9c12-d89d1f03beae" />
<br/>

<img width="560" alt="image" src="https://github.com/user-attachments/assets/39a7754c-f346-4a75-8887-3f5a87b50d60" />
<br/>
<img width="761" alt="image" src="https://github.com/user-attachments/assets/08a67bbd-247e-420b-8b14-bb44363cebc8" />
<br/>
<img width="1081" alt="image" src="https://github.com/user-attachments/assets/ab7af516-29c0-4bdc-abae-82dcd40e464a" />
<br/>
<img width="1152" alt="image" src="https://github.com/user-attachments/assets/81c0c800-6ff8-434a-bb42-70615f83b505" />
<br/>
<img width="1006" alt="image" src="https://github.com/user-attachments/assets/bcd9f049-1a35-4306-8397-e49d6b408850" />
<br/>
<img width="1143" alt="image" src="https://github.com/user-attachments/assets/d4198495-d51b-4e4e-946d-77a57e0a4602" />
<br/>
<img width="1151" alt="image" src="https://github.com/user-attachments/assets/2bc43159-6084-4ac4-95de-57e28b39cca7" />
<br/>
<img width="523" alt="image" src="https://github.com/user-attachments/assets/d7933c54-37f3-48ae-a068-546a01c9817c" />
<br/>
<img width="493" alt="image" src="https://github.com/user-attachments/assets/a48e7b44-eae7-4ff6-9bdd-255212410063" />
<br/>


### Resources:
* Kubeadm Upgrade Documentation
* Kubeadm Cluster Upgrade Guide
* YouTube Video on Kubeadm Upgrades

## 4. EKS Cluster Upgrade
* Upgrade the EKS Control Plane to a newer version using AWS CLI.
* Update the node groups to match the Control Plane version.
* Confirm the upgrade with `kubectl version`.

<img width="1126" alt="image" src="https://github.com/user-attachments/assets/6fd6b52a-edb0-42e8-bb06-943628002e4c" />
<br/>
<img width="1133" alt="image" src="https://github.com/user-attachments/assets/44c85037-68ce-4df9-b0ee-e6faf3f850ea" />
<br/>
<img width="1125" alt="image" src="https://github.com/user-attachments/assets/55b73764-84e8-4482-ac9e-a09eb55846c7" />
<br/>
<img width="1130" alt="image" src="https://github.com/user-attachments/assets/a38a8f76-0664-4527-9b50-d9886b7b1f27" />
<br/>
<img width="1137" alt="image" src="https://github.com/user-attachments/assets/ca5e942c-b946-40db-9a4f-0ae66eb55c6e" />
<br/>






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

