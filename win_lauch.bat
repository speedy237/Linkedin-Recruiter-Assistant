@echo off
REM Changer le répertoire de travail pour celui où se trouve le fichier docker-compose.yml
cd /d %~dp0

REM Vérifier si Docker est en cours d'exécution
docker info >nul 2>&1
if %errorlevel% neq 0 (
    echo Docker n'est pas en cours d'exécution. Veuillez démarrer Docker Desktop.
    exit /b 1
)

REM Lancer les conteneurs avec docker-compose
echo Lancement des conteneurs avec Docker Compose...
docker-compose up -d

REM Vérifier si les conteneurs sont bien en cours d'exécution
docker ps
