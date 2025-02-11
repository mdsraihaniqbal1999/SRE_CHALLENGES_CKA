#Day22 Challenge: Kubernetes Backup and Restore with etcd and Velero


Hello Learners,

Welcome back to another thrilling episode of the DevOps SRE Daily Challenge! 🎉

Today, you’ll dive into the heart of Kubernetes resilience by mastering etcd backup and restore processes. Your mission? To ensure your clusters are bulletproof against disasters, equipped with robust recovery strategies, and ready to tackle real-world challenges or ace Kubernetes certifications like CKA!

## What You'll Learn:
- How to back up and restore etcd, the core datastore of Kubernetes.
- How to back up and restore an Amazon EKS cluster using Velero, a powerful Kubernetes backup tool.
- The importance of backup strategies and how they minimize downtime during unexpected failures.

## Challenge Tasks:

### The Backup and Restore Theory Challenge:
Before you jump into action, let’s set the foundation:

#### What is etcd?
- Define etcd and explain its role in Kubernetes.
- Why is it vital to back up etcd regularly?

#### Backup and Restore Best Practices:
- List essential practices for managing backups of etcd and Kubernetes clusters.
- Discuss the importance of automating backup workflows.

#### Velero Overview:
- What is Velero, and how does it simplify Kubernetes backups?
- Share a high-level overview of its architecture and components.

## Practical: Ensuring Cluster Resilience
Time to roll up your sleeves and implement backup strategies!

### Task 1: etcd Backup and Restore
**Setup:** Use a Kubernetes cluster deployed via Kubeadm for this task.

#### Backup etcd:
Take a snapshot of the etcd datastore using `etcdctl`:
```sh
ETCDCTL_API=3 etcdctl snapshot save <backup-file> --endpoints=<etcd-endpoint>
```
Verify the snapshot is saved correctly.

#### Simulate Data Loss:
Mimic a failure scenario by deleting a few pods from your cluster.

#### Restore etcd:
Restore etcd from the snapshot using `etcdctl snapshot restore`:
```sh
ETCDCTL_API=3 etcdctl snapshot restore <backup-file> --data-dir=<new-data-dir>
```
Reconfigure etcd to use the restored data directory and restart etcd.

#### Validate Restore:
Confirm cluster functionality by running a few `kubectl` commands and verify previously deleted pods are running.

### Task 2: Backup and Restore EKS Cluster Using Velero
**Setup:** Use an Amazon EKS cluster for this task.

#### Install and Configure Velero:
- Set up Velero on your system, configured to use an S3-compatible storage backend.

#### Backup Your EKS Cluster:
Use Velero to back up your cluster resources:
```sh
velero backup create <backup-name> --include-namespaces <namespace>
```
Verify the backup is stored in your storage bucket.

#### Restore to a New EKS Cluster:
- Create a new EKS cluster.
- Use Velero to restore the resources to the new cluster:
```sh
velero restore create --from-backup <backup-name>
```

#### Validate Restore:
- Ensure that all resources, such as deployments and services, are correctly restored in the new cluster.

**Note:** You can use a Kubeadm cluster instead of an EKS cluster to perform the above tasks.

## Bonus Task:
### Automate Backups:
- Write a script to automate backups for etcd and EKS using `etcdctl` and Velero.
- Schedule the script to run periodically using cron or Kubernetes CronJobs.

### Report Observations:
- Note any challenges, insights, or unusual configurations observed during the restore processes.

## Submission Guidelines:
Submit the following:
- Answers to the theory section.
- Screenshots of:
  - etcd backup and restore steps.
  - Velero backup and restore workflows.
  - The restored cluster and resource validations.
- The script used for the bonus task.
- Your insights and observations from the task.

Post your progress with the hashtags: `#ClusterResilience`, `#KubernetesBackup`, `#SRELife`, `#DevOpsForAll`

## Resources to Help You:
- etcd Backup and Restore - GitHub
- etcd Backup and Restore - Video
- Velero EKS Backup Guide - AWS Blog
- Kubernetes etcd Documentation

If you missed any previous challenges, you can catch up by reviewing the problem statements on GitHub.

Best regards,  
**Sagar Utekar**

