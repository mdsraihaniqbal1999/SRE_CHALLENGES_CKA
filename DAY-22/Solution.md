# The Backup and Restore Theory Challenge

## What is etcd?

**Define etcd and explain its role in Kubernetes:**

etcd is a highly-available, distributed key-value store that acts as Kubernetes' primary database. It stores all cluster data, including:
- Configuration data
- State information
- Metadata about all objects running in the cluster
- Service discovery details
- API objects

In Kubernetes, etcd serves as the single source of truth for the cluster state. Every change in the cluster (like deploying new pods, updating configurations, or changing secrets) is recorded in etcd. The Kubernetes API server reads from and writes to etcd to maintain cluster state consistency.

**Why is it vital to back up etcd regularly?**

Regular etcd backups are crucial because:
1. They provide disaster recovery capabilities if the cluster experiences catastrophic failure
2. They protect against data corruption or accidental deletions
3. They enable cluster state restoration to a known good point
4. They facilitate cluster migration between environments
5. They help maintain compliance with data retention policies

## Backup and Restore Best Practices

**Essential practices for managing backups of etcd and Kubernetes clusters:**

1. Schedule Regular Backups:
   - Perform automated daily backups of etcd
   - Store multiple backup versions
   - Implement proper backup rotation policies

2. Secure Your Backups:
   - Encrypt backup data
   - Store backups in multiple geographic locations
   - Implement access controls for backup data

3. Validate Backup Integrity:
   - Regularly test backup restoration
   - Verify backup completeness
   - Document restoration procedures

4. Monitor Backup Operations:
   - Set up alerts for failed backups
   - Track backup completion status
   - Monitor backup storage usage

**Importance of automating backup workflows:**

Automation is essential for backup management because it:
1. Eliminates human error in backup processes
2. Ensures consistent backup scheduling
3. Reduces operational overhead
4. Enables immediate response to backup failures
5. Provides audit trails for compliance
6. Facilitates integration with monitoring systems

## Velero Overview

**What is Velero, and how does it simplify Kubernetes backups?**

Velero is an open-source backup and disaster recovery tool that simplifies the process of:
- Backing up Kubernetes clusters
- Restoring cluster resources
- Migrating cluster resources between clusters
- Replicating production environments for testing

It simplifies Kubernetes backups by providing:
- A unified interface for backup operations
- Support for multiple storage providers
- Application-consistent backups
- Scheduled backup operations
- Selective backup and restore capabilities

**Share a high-level overview of its architecture and components:**

Velero's architecture consists of several key components:

<img width="767" alt="image" src="https://github.com/user-attachments/assets/ad094f4a-b7c5-424b-ac6a-da37ba8f1c9d" />
<img width="607" alt="image" src="https://github.com/user-attachments/assets/fb651ed9-5990-4257-8a1a-d1b9c12c2c0c" />



1. Server-side Components:
   - Velero Server: Runs in your Kubernetes cluster and manages backup/restore operations
   - Backup Controller: Handles the backup process
   - Restore Controller: Manages restore operations
   - Schedule Controller: Manages scheduled backups

2. Client-side Tools:
   - Velero CLI: Command-line interface for managing operations
   - Storage Plugins: Connect to various backup storage providers
   - Volume Snapshotter Plugins: Handle persistent volume backups

3. Storage Infrastructure:
   - Object Storage: Stores backup files (e.g., AWS S3, Azure Blob Storage)
   - Volume Snapshots: Stores persistent volume backups
   - Backup Storage Location: Defines where backups are stored
   - Volume Snapshot Location: Defines where volume snapshots are stored

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
<img width="605" alt="image" src="https://github.com/user-attachments/assets/fde00994-ebab-49d7-8463-7388769b4c75" />
<img width="1104" alt="image" src="https://github.com/user-attachments/assets/489de1a4-a9b9-4969-9283-27760baab307" />
<img width="840" alt="image" src="https://github.com/user-attachments/assets/3b22898a-47af-4da0-9c1e-dfa681c6dac4" />
<img width="708" alt="image" src="https://github.com/user-attachments/assets/469ad722-8f7e-415a-ab64-d61c29254d60" />




#### Install and Configure Velero:
- Set up Velero on your system, configured to use an S3-compatible storage backend.
  <img width="1128" alt="image" src="https://github.com/user-attachments/assets/21bcdd90-f7c9-421a-84a8-04420926e1b8" />
  <img width="699" alt="image" src="https://github.com/user-attachments/assets/b50c0e57-6c36-4db5-bf0a-0bc4cdb6c980" />
  <img width="797" alt="image" src="https://github.com/user-attachments/assets/1db89ca8-39ce-473f-b7ee-b7a6c7170949" />
  <img width="1124" alt="image" src="https://github.com/user-attachments/assets/e67de722-8261-4734-8b65-dfe2f11eb850" />
  <img width="961" alt="image" src="https://github.com/user-attachments/assets/93dec4a1-eddb-4097-9ee2-b09f4e55a2a4" />
  <img width="1122" alt="image" src="https://github.com/user-attachments/assets/be8b17e4-f647-4b23-9148-9a96e5e82d87" />
  <img width="965" alt="image" src="https://github.com/user-attachments/assets/3b2144a1-881f-42ad-8022-01a937c67eca" />
  <img width="507" alt="image" src="https://github.com/user-attachments/assets/47fc4cba-d9d8-4681-b7a5-3d808dd58858" />
  <img width="1059" alt="image" src="https://github.com/user-attachments/assets/54b445cf-c64d-4a78-98e1-386312dc50b9" />
  <img width="806" alt="image" src="https://github.com/user-attachments/assets/f38e6b66-b613-44b2-a8fc-6f79822ea541" />
  <img width="582" alt="image" src="https://github.com/user-attachments/assets/40469858-89ca-4242-a02a-12684f577af7" />
  <img width="1021" alt="image" src="https://github.com/user-attachments/assets/8eada17f-54da-429e-ab07-a2d88d312eaf" />
  <img width="1096" alt="image" src="https://github.com/user-attachments/assets/2ed3f937-6f44-435f-a102-b6ad572a2f5b" />
  <img width="910" alt="image" src="https://github.com/user-attachments/assets/a246940a-870b-4d95-8f67-e35d3f8581a4" />
<img width="916" alt="image" src="https://github.com/user-attachments/assets/2f4c43d9-2b0b-435f-a530-d730df597ca5" />
<img width="908" alt="image" src="https://github.com/user-attachments/assets/2caecc71-4b92-4f3a-a8c1-d4db7644afaa" />
<img width="772" alt="image" src="https://github.com/user-attachments/assets/cdf5b892-18f7-4d4c-86d5-b96eaf9481f3" />
<img width="945" alt="image" src="https://github.com/user-attachments/assets/92281279-3cde-44ab-b453-a988c5fc5ecf" />
<img width="682" alt="image" src="https://github.com/user-attachments/assets/6c75af39-3092-42a4-a0fa-dd4a036795e5" />
<img width="799" alt="image" src="https://github.com/user-attachments/assets/9eb5f5ec-e3ff-42ec-a582-3ad029e6cf79" />






















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
