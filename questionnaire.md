# Questionnaire

## 1. Vous accès à un dépôt Github fluffy-octo-sniffle, à quel endroit pouvez-vous trouver la définition des éventuelles pipeline CI/CD ?

La pipeline CI/CD ce trouve dans le dossier github/workflows dans le fichier build.yaml

## 2. Proposer au format PNG un schéma qui reprend les étapes essentielles selon vous du pipeline CI/CD.

Le schéma se trouve dans le dossier schéma. (cicd\schéma\schema.drawio.png)

## 3. Pouvez-vous reproduire à l’identique cette pipeline avec Jenkins ? Si non, quelles sont les informations manquantes ?

Ont peux la reproduire en grande partie mais pas totalement. 
Il manque surtout les éléments secret comme le token sonar, mais encore la config exacte de SonarQube et les paramètres du quality gate.

## 4. Concernant le projet fluffy-octo-sniffle, que pouvez-vous en revanche critiquer sur le fichier compose.yaml à la racine du projet ?

Le fichier utilise sonarqube:latest, ce qui n'est pas très propre car la version peux changer.
Il y a aussi un token en clair et pas de healthcheck pour attendre que SonarQube soit prêt.

## 5. Si nous devons augmenter le nombre de conteneurs associés au service sonarqube, quel problème allons-nous rencontrer ?

Le problème est le port 9000:9000, car plusieurs conteneurs ne peuvent pas utiliser le même port.

## 6. Dans le cas où on vous demande de créer plusieurs stacks compose et que les services doivent communiquer, quelle notion devez-vous utiliser ?

Il faut utiliser un réseau Docker externe partagé.
Comme ça, plusieurs stacks compose peuvent communiquer entre elles sur le même réseau.

## 7. Vous souhaitez accéder à une ressource accessible uniqument sur la machine hôte, que devez-vous utiliser ?

Il faut utiliser host.docker.internal.

## 8. Si vous souhaitez établir un accès complémentaire suivant un autre alias DNS entre 2 services, que pensez-vous devoir utiliser ?

Il faut utiliser les alias réseau dans Docker Compose.
Cela permet d'appeler un service avec un autre nom DNS.

## 9. Comment remplacer l’injection de valeurs dans une variable d’environnement ?

Ont peux remplacer ça par des secrets Docker, cela évite de mettre un mot de passe ou un token directement dans les variables d'environnement.

## 10. En dépit de toute considération pour la sécurité, comment créer une image basée sur postgres:latest avec le mot de passe mypassword par défaut pour le compte postgres ?

Voici : 

FROM postgres:latest
ENV POSTGRES_PASSWORD=mypassword