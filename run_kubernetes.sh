#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=trungtq1991/udacity-project4

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run udacitycontainer --image=$dockerpath:latest --port=80

# Step 3:
# List kubernetes pods
while [[ $(kubectl get pods udacitycontainer -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do
   sleep 1
done
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward udacitycontainer 8000:80
