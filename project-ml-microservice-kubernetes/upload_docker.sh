#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=trungtq1991/udacity-project4

# Step 2:  
# Authenticate & tag
docker login --username=trungtq1991
docker image tag udacity-project4 $dockerpath
echo "Docker ID and Image: $dockerpath"

# Step 3:
docker push $dockerpath
