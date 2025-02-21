#!/bin/bash

# Construire l'image Docker pour le frontend
echo "Building frontend image..."

# Accéder au répertoire frontend et construire l'image
docker build -t aubayjobs_frontend:0.0.1 .

echo "Frontend image built successfully!"
