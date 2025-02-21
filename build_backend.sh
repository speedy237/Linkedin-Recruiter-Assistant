#!/bin/bash

# Construire l'image Docker pour le backend
echo "Building backend image..."

# Accéder au répertoire backend et construire l'image
docker build -t aubayjobs_backend:0.0.1 -f backend.Dockerfile .

echo "Backend image built successfully!"
