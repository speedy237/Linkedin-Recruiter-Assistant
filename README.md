
# Linkedin AI Recruiter Assistant

## Description

Aubay AI Recruiter Assistant est un outil d'intelligence artificielle conçu pour automatiser et optimiser le processus de recrutement. Il offre les fonctionnalités suivantes :

- Analyse des descriptions de poste pour extraire les exigences telles que l'expérience nécessaire, le diplôme requis, etc.
- Lecture des candidatures, téléchargement des CV, analyse et extraction des qualifications des candidats telles que l'expérience, le diplôme, etc.
- Comparaison des qualifications des candidats avec les exigences du poste et calcul d'un score de correspondance.

## Installation

### Prérequis

- **Docker** et **Docker Compose** doivent être installés sur votre machine. Si ce n'est pas déjà fait, vous pouvez installer Docker en suivant les instructions officielles [ici](https://docs.docker.com/get-docker/) et Docker Compose [ici](https://docs.docker.com/compose/install/).
- **Git** pour cloner le projet si nécessaire.

### Structure du Projet

```bash
.
├── README.md
├── docker-compose.yml
├── backend/
│   └── Dockerfile
│   └── ... (autres fichiers de l'application backend)
├── frontend/
│   └── Dockerfile
│   └── ... (autres fichiers de l'application frontend)
├── workers/
│   └── Dockerfile
│   └── ... (autres fichiers des workers)
├── .env
└── start_docker_containers.sh
```

### Étape 1 : Construire les images Docker

Avant de démarrer les conteneurs, vous devez construire les images Docker pour le backend, le frontend et les workers.

```bash
# Construire l'image backend
docker build -t aubayjobs_backend:0.0.1 ./backend

# Construire l'image frontend
docker build -t aubayjobs_frontend:0.0.1 ./frontend

# Construire l'image worker
docker build -t aubayjobs_worker:0.0.1 ./workers
## Construire les images a partir des fichier .sh
#Rendre les scripts exécutables : Avant de pouvoir exécuter les fichiers .sh, tu dois leur donner des permissions d'exécution. Dans ton terminal, exécute les commandes suivantes :
```
chmod +x build_frontend.sh
```
chmod +x build_backend.sh
```
chmod +x build_worker.sh

##Lancer le frontend

```
./build_frontend.sh

##Lancer le backend
```
./build_backend.sh

##Lancer les worker celery
```
./build_worker.sh






### Étape 2 : Lancer Docker Compose

Une fois les images Docker construites, vous pouvez démarrer tous les services définis dans `docker-compose.yml`.

```bash
docker-compose up -d
```

Cette commande démarre tous les services définis dans le fichier `docker-compose.yml`, notamment :

- Backend (API FastAPI)
- Frontend (Application React)
- Workers (Celery + RabbitMQ)
- MySQL (Base de données)
- RabbitMQ (Message broker)
- phpMyAdmin (Interface de gestion de MySQL)

Vérifiez que tous les conteneurs fonctionnent correctement avec la commande suivante :

```bash
docker ps
```

### Étape 3 : Programmer le service Unix pour démarrer Docker au démarrage de la machine

Pour que les conteneurs démarrent automatiquement lors du démarrage de votre machine Linux, vous pouvez créer un service systemd.

Créez un fichier de service systemd dans `/etc/systemd/system/` avec le nom `docker-compose-app.service`. Utilisez un éditeur de texte comme nano ou vim :

```bash
sudo nano /etc/systemd/system/docker-compose-app.service
```

Ajoutez le contenu suivant dans ce fichier :

```ini
[Unit]
Description=Start Docker Compose for the project
After=docker.service
Requires=docker.service

[Service]
Type=simple
WorkingDirectory=/chemin/vers/ton/projet
ExecStart=/usr/local/bin/docker-compose up -d
ExecStop=/usr/local/bin/docker-compose down
Restart=always
User=ton_utilisateur
Group=ton_groupe

[Install]
WantedBy=multi-user.target
```

Remplacez `/chemin/vers/ton/projet` par le chemin absolu de votre répertoire de projet contenant le fichier `docker-compose.yml`. Remplacez `ton_utilisateur` et `ton_groupe` par votre nom d'utilisateur et votre groupe système.

Rechargez les unités systemd pour prendre en compte ce nouveau service :

```bash
sudo systemctl daemon-reload
```

Activez le service pour qu'il se lance automatiquement au démarrage du système :

```bash
sudo systemctl enable docker-compose-app.service
```

Vous pouvez maintenant démarrer le service manuellement si nécessaire :

```bash
sudo systemctl start docker-compose-app.service
```

Pour vérifier l'état du service :

```bash
sudo systemctl status docker-compose-app.service
```

### Étape 4 : Utiliser le script shell pour démarrer les conteneurs

Si vous ne souhaitez pas créer un service systemd, vous pouvez utiliser un script shell pour démarrer les conteneurs manuellement à chaque démarrage.

Le fichier `start_docker_containers.sh` est un script qui peut être utilisé pour démarrer tous les services Docker définis dans `docker-compose.yml`. Exécutez simplement ce script :

```bash
./start_docker_containers.sh
```

Cela lancera tous les conteneurs définis dans `docker-compose.yml` et affichera la liste des conteneurs en cours d'exécution.




