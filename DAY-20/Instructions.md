# Step 1: Creating Kind Clusters

## Create development cluster
```sh
kind create cluster \
  --name kind-dev-cluster \
  --image kindest/node:v1.32.0
```

## Create staging cluster
```sh
kind create cluster \
  --name kind-staging-cluster \
  --image kindest/node:v1.31.4
```

## Create production cluster
```sh
kind create cluster \
  --name kind-prod-cluster \
  --image kindest/node:v1.30.8
```

# Step 2: Merge Configurations

## Export each cluster's kubeconfig
```sh
kind export kubeconfig --name kind-kind-dev-cluster --kubeconfig=kind-dev
kind export kubeconfig --name kind-kind-staging-cluster --kubeconfig=kind-staging
kind export kubeconfig --name kind-kind-prod-cluster --kubeconfig=kind-prod
```

## Merge configurations
```sh
KUBECONFIG=kind-dev:kind-staging:kind-prod kubectl config view --flatten > merged-config
export KUBECONFIG=merged-config
```

# Step 3: Create Namespaces

## Create namespaces in dev cluster
```sh
kubectl --context kind-kind-dev-cluster create namespace dev-team
```

## Create namespaces in staging cluster
```sh
kubectl --context kind-kind-staging-cluster create namespace qa-team
```

## Create namespaces in prod cluster
```sh
kubectl --context kind-kind-prod-cluster create namespace prod-team
```

# Step 4: Deploy Applications

## Deploy Nginx in dev cluster
```sh
kubectl --context kind-kind-dev-cluster create deployment nginx-deployment \
  --image=nginx:latest \
  --namespace dev-team \
  --replicas=2

kubectl --context kind-kind-dev-cluster expose deployment nginx-deployment \
  --namespace dev-team \
  --port=80 \
  --type=ClusterIP
```

## Deploy Redis in staging cluster
```sh
kubectl --context kind-kind-staging-cluster create deployment redis-deployment \
  --image=redis:latest \
  --namespace qa-team \
  --replicas=1

kubectl --context kind-kind-staging-cluster expose deployment redis-deployment \
  --namespace qa-team \
  --port=6379 \
  --type=ClusterIP
```

## Deploy Python app in prod cluster
```sh
kubectl --context kind-kind-prod-cluster create deployment python-deployment \
  --image=python:3 \
  --namespace prod-team \
  --replicas=3

kubectl --context kind-kind-prod-cluster expose deployment python-deployment \
  --namespace prod-team \
  --port=8080 \
  --type=ClusterIP
```

## Set container command for Python deployment
```sh
kubectl --context kind-kind-prod-cluster patch deployment python-deployment \
  -n prod-team \
  --patch '{"spec": {"template": {"spec": {"containers": [{"name": "python","command": ["python", "-m", "http.server", "8080"]}]}}}}'
```

# Step 5: Verify Setup

## Check cluster access
```sh
kubectl config get-contexts
```

## Verify namespaces
```sh
for cluster in kind-kind-dev-cluster kind-kind-staging-cluster kind-kind-prod-cluster; do
  echo "Namespaces in $cluster:"
  kubectl --context $cluster get namespaces
done
```

## Verify deployments
```sh
kubectl --context kind-kind-dev-cluster get all -n dev-team
kubectl --context kind-kind-staging-cluster get all -n qa-team
kubectl --context kind-kind-prod-cluster get all -n prod-team
```
