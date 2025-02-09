# EKS Cluster Upgrade

Upgrade the EKS Control Plane to a newer version using AWS CLI.

Update the node groups to match the Control Plane version.

Confirm the upgrade with kubectl version.

Note: EKS also provides an auto mode for node groups, which simplifies the process of keeping your nodes up-to-date. While this reduces manual intervention, it’s important to monitor the process and validate workloads after the upgrade to ensure seamless transitions.

