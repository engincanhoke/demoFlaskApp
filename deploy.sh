#!/bin/bash

az login --service-principal -u $SERVICE_PRINCIPAL_ID -p $SERVICE_PRINCIPAL_SECRET --tenant $TENANT 1> /dev/null

echo "Getting credentials for cluster..."
az aks get-credentials --name $CLUSTER_NAME --resource-group $RESOURCE_GROUP_NAME

kubectl get nodes

echo "Helm List --------------------"
helm list