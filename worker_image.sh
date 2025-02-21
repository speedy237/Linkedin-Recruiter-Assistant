#!/bin/bash

# Construire l'image Docker pour le worker
echo "Building worker image..."

# Accéder au répertoire workers et construire l'image
docker build -t aubayjobs_worker:0.0.1 ./workers

echo "Worker image built successfully!"
