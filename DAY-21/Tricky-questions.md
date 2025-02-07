# Tricky Kubernetes Upgrade Interview Questions
> Advanced interview questions about Kubernetes cluster upgrades with detailed explanations

## Table of Contents
- [Critical Thinking Questions](#critical-thinking-questions)
- [Scenario-Based Questions](#scenario-based-questions)
- [Technical Deep Dives](#technical-deep-dives)
- [Troubleshooting Questions](#troubleshooting-questions)

## Critical Thinking Questions

### Q1: During a cluster upgrade, you notice that pods are being rescheduled despite not draining the nodes. What might be happening?

**Answer:**
This is a tricky situation that could be caused by:

1. **Pod Disruption Budget (PDB)**:
   - PDBs might be misconfigured
   - Default settings might allow pod evacuation

2. **Node Auto-scaling**:
   - Cluster autoscaler might be active
   - New nodes might be being added

3. **Pod Eviction**:
   - Resource pressure might trigger automatic eviction
   - Taints might be automatically applied

Best practice solution:
```bash
# Check PDBs
kubectl get pdb --all-namespaces

# Check node conditions
kubectl describe node <node-name>

# Check cluster events
kubectl get events --sort-by='.lastTimestamp'
```

### Q2: If a node fails during the upgrade process after draining but before updating, what is the correct sequence of actions to recover?

**Answer:**
The recovery sequence should be:

1. First, check node status:
```bash
kubectl get nodes
kubectl describe node <failed-node>
```

2. If node is unreachable:
```bash
# Force delete pods on failed node
kubectl delete pods --force --grace-period=0 -l node=<failed-node>
```

3. Remove node from cluster:
```bash
kubectl delete node <failed-node>
```

4. Rejoin node with correct version:
```bash
kubeadm join --token <token> <control-plane-host>:<port>
```

### Q3: You're upgrading a cluster with stateful applications. Some pods fail to reschedule after the upgrade. What's the most likely cause and solution?

**Answer:**
This is complex because several factors could be involved:

1. **Volume Binding**:
   - PVs might still be bound to old node
   - Solution:
     ```bash
     # Check PV status
     kubectl get pv
     
     # Delete pod (not PVC)
     kubectl delete pod <pod-name>
     ```

2. **Node Selectors**:
   - Old node labels might be missing
   - Solution:
     ```bash
     # Check node labels
     kubectl get nodes --show-labels
     
     # Add missing labels
     kubectl label nodes <node-name> <key>=<value>
     ```

3. **StatefulSet Ordering**:
   - Pods must start in sequence
   - Solution:
     ```bash
     # Check StatefulSet events
     kubectl describe statefulset <name>
     ```

## Scenario-Based Questions

### Q4: Your cluster upgrade fails halfway through. The control plane is at version 1.32 but worker nodes are at 1.31. What problems might you face and how do you handle them?

**Answer:**
This version skew scenario requires careful handling:

1. **API Compatibility**:
   - Control plane can be one version ahead
   - Workers can be two versions behind
   - Solution: Complete worker upgrades within supported skew

2. **Feature Gates**:
   - New features might be enabled but unsupported
   - Solution:
     ```bash
     # Check feature gates
     kubectl get nodes -o json | jq '.items[].metadata.annotations'
     ```

3. **Recovery Steps**:
```bash
# Check node versions
kubectl get nodes -o wide

# Resume upgrade on workers
kubeadm upgrade node
kubectl drain <node-name> --ignore-daemonsets
# Upgrade kubelet
apt-mark unhold kubelet && \
apt-get update && apt-get install -y kubelet=1.32.0-1.1
```

## Technical Deep Dives

### Q5: Explain why the following upgrade sequence might fail:
```bash
kubectl drain node01
apt-get upgrade -y kubeadm
kubeadm upgrade node
systemctl restart kubelet
kubectl uncordon node01
```

**Answer:**
Several issues in this sequence:

1. **Missing Version Lock**:
   - Should use specific version
   - Correct:
     ```bash
     apt-mark unhold kubeadm
     apt-get install -y kubeadm=1.32.0-1.1
     apt-mark hold kubeadm
     ```

2. **Kubelet Skip**:
   - Kubelet not upgraded
   - Correct:
     ```bash
     apt-mark unhold kubelet
     apt-get install -y kubelet=1.32.0-1.1
     apt-mark hold kubelet
     ```

3. **Missing Verification**:
   - No status check
   - Correct:
     ```bash
     systemctl status kubelet
     kubectl get nodes
     ```

### Q6: During an upgrade, you notice that some pods remain in "Terminating" state despite draining. What are three different ways to handle this?

**Answer:**
Here are three approaches, from least to most forceful:

1. **Investigate and Fix**:
```bash
# Check pod details
kubectl describe pod <pod-name>

# Check finalizers
kubectl get pod <pod-name> -o json | jq '.metadata.finalizers'

# Remove finalizers if stuck
kubectl patch pod <pod-name> -p '{"metadata":{"finalizers":null}}'
```

2. **Force Delete**:
```bash
kubectl delete pod <pod-name> --force --grace-period=0
```

3. **Direct etcd Cleanup**:
```bash
ETCDCTL_API=3 etcdctl del /registry/pods/default/<pod-name>
```

## Troubleshooting Questions

### Q7: After upgrading a node, pods fail to start with the error "container runtime is down". What's your troubleshooting approach?

**Answer:**
Systematic troubleshooting approach:

1. **Check Container Runtime**:
```bash
# Check status
systemctl status containerd

# Check logs
journalctl -u containerd
```

2. **Verify Kubelet Configuration**:
```bash
# Check kubelet args
ps aux | grep kubelet

# Check config
cat /var/lib/kubelet/config.yaml
```

3. **Resolution Steps**:
```bash
# Restart services in order
systemctl restart containerd
systemctl restart kubelet

# Verify node status
kubectl describe node <node-name>
```

### Q8: You notice that after upgrading, some custom resources (CRDs) stop working. What might be the cause and solution?

**Answer:**
This is a common issue with API version changes:

1. **Check API Versions**:
```bash
# List API resources
kubectl api-resources

# Check CRD versions
kubectl get crd -o yaml
```

2. **Version Migration**:
- Update CRD definitions
- Migrate to new API versions
- Example:
  ```bash
  # Backup CRDs
  kubectl get crd -o yaml > crd-backup.yaml
  
  # Update API versions
  kubectl replace -f updated-crd.yaml
  ```

3. **Best Practices**:
- Always check release notes for API deprecations
- Test upgrades in non-production first
- Keep CRD backups

## Contributing
Feel free to submit additional questions or improvements.

## License
[MIT](LICENSE)
