#!/bin/sh

az login --service-principal -u $SERVICE_PRINCIPAL_ID -p $SERVICE_PRINCIPAL_SECRET --tenant $TENANT 1> /dev/null

echo "Getting credentials for cluster..."
az aks get-credentials --name $CLUSTER_NAME --resource-group $RESOURCE_GROUP_NAME

helm install flask --name flaskdemo --set image.repository=mertongngl/flaskdemo --set image.tag=latest --set service.name=flaskdemo --namespace travistest

echo "Helm List --------------------"
helm list