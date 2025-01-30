#!/bin/bash

# Default values for parameters
CLUSTER_NAMES="kind-dev-cluster kind-staging-cluster kind-prod-cluster"
CONTEXT_NAMES="kind-kind-dev-cluster kind-kind-prod-cluster kind-kind-staging-cluster"
NAMESPACES="dev-team qa-team prod-team"
KUBECONFIG_FILES="kind-dev kind-staging kind-prod merged-config"

# Function to delete Kind clusters
delete_kind_clusters() {
  echo "Deleting Kind clusters..."
  for cluster in $CLUSTER_NAMES; do
    kind delete cluster --name $cluster
  done
  echo "Kind clusters deleted."
}

# Function to delete contexts from kubeconfig
delete_contexts() {
  echo "Deleting contexts from kubeconfig..."
  for context in $CONTEXT_NAMES; do
    kubectl config delete-context $context
  done
  echo "Contexts deleted."
}

# Function to delete kubeconfig files
delete_kubeconfig_files() {
  echo "Deleting kubeconfig files..."
  for file in $KUBECONFIG_FILES; do
    rm -f $file
  done
  unset KUBECONFIG
  echo "Kubeconfig files deleted."
}

# Function to delete namespaces and resources
delete_namespaces_and_resources() {
  echo "Deleting namespaces and resources..."
  IFS=' ' read -r -a context_array <<< "$CONTEXT_NAMES"
  IFS=' ' read -r -a namespace_array <<< "$NAMESPACES"

  for i in "${!context_array[@]}"; do
    kubectl --context ${context_array[i]} delete namespace ${namespace_array[i]} --ignore-not-found
  done
  echo "Namespaces and resources deleted."
}

# Main function to execute all cleanup steps
main() {
  delete_kind_clusters
  delete_contexts
  delete_kubeconfig_files
  delete_namespaces_and_resources
  echo "Cleanup completed successfully."
}

# Execute the main function
main
