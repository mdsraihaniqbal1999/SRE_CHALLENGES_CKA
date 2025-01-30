### Theory Challenge

1. **Multi-Cluster Management Concepts**
   - Define multi-cluster management in Kubernetes?
   - Explore use cases: high availability, disaster recovery, multi-cloud strategies?
   -<h3>Definition:</h2>
     - **Multicluster Management:** Refers to the ability to manage, operate, and interact with multiple Kubernetes clusters simultaneously.
     - **Multinamespace Management:** Involves isolating workloads within the same cluster using namespaces for better resource segregation and access control.

     -<h3>Importance of Multi-cluster and Multi-namespace Setups:</h3>
     - **Disaster Recovery:** Having resources deployed across clusters ensures fault tolerance. If one cluster fails, others remain operational.
     - **High Availability:** Distributing workloads across regions or clusters ensures users experience minimal downtime.
     - **Environment Isolation:** Helps segregate dev, staging, and prod workloads for testing and deployment without conflicts.
     - **Multi-cloud Strategies:** Enables organizations to avoid vendor lock-in by managing workloads across AWS, Azure, GCP, or on-premises Kubernetes clusters.


2. **Kubeconfig Deep Dive**
   - Understand kubeconfig file structure
   - Learn to merge kubeconfig files from different clusters

3. **Exam Strategies**
   - Techniques for quick context and namespace switching
   - Avoiding common multi-cluster management pitfalls

### Practical Challenge

#### Cluster Setup
- Create three Kind clusters with different Kubernetes versions:
  - `kind-dev-cluster`: v1.32.0
<img width="934" alt="image" src="https://github.com/user-attachments/assets/630b50c5-3c64-49d9-a590-7afd6d49347f" />


  - `kind-staging-cluster`: v1.31.4
<img width="531" alt="image" src="https://github.com/user-attachments/assets/b92fd75e-2962-4b70-b0e9-18602e624d87" />


  - `kind-prod-cluster`: v1.30.8
<img width="480" alt="image" src="https://github.com/user-attachments/assets/bbc5ab6c-9401-430a-a6db-1fc65180ae93" />


<img width="373" alt="image" src="https://github.com/user-attachments/assets/7623cb19-5409-4a17-9ff2-ec507266340d" />


#### Configuration Unification
- Merge cluster configurations
- Verify cluster accessibility using `kubectl`

#### Namespace and Resource Deployment
- Deploy resources in specific namespaces:
  - `dev-team` namespace: Nginx application
  - `qa-team` namespace: Redis
  - `prod-team` namespace: Python3 application

## Submission Requirements

- Detailed theory answers
- Screenshots of cluster setups
- Resource deployment configurations
- Context switching documentation
