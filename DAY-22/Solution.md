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
