# 🚀 Déploiement sur Render – Guide Complet

## 1️⃣ Préparer le projet

Avant de déployer, assurez-vous que votre projet contient :

- Dockerfile
- docker-compose.yml (optionnel)
- Code Spring Boot
- CI GitHub Actions (push → build image Docker)

---

## 2️⃣ Créer le Web Service Render

1. Aller sur : https://dashboard.render.com  
2. Cliquer **New → Web Service**
3. Choisir **Build & Deploy from GitHub**
4. Sélectionner le repository :

2025-devops-cd-oumaima-real

---

## 3️⃣ Configuration Render

### 🔧 Build Command

./mvnw clean package -DskipTests

### 🔧 Start Command

java -jar target/*.jar

### 🔧 Environment

- Environment = Docker  
- Render détecte automatiquement votre Dockerfile  
- Port utilisé par Render : `${PORT}`  

---

## 4️⃣ Tester l’application en ligne

Une fois le déploiement terminé, Render vous donnera une URL.

Exemple :

https://spring-app-latest-xxxxx.onrender.com

Cette URL doit afficher la page Spring Boot.

---

## 5️⃣ Vérifier les Logs Render

Aller sur **Logs** → vérifier que l’application démarre.

Vous devez voir :

Tomcat started on port ${PORT}
Started TpCd2024Application

Si erreur, vérifier :

- Variables d’environnement  
- Dockerfile  
- Connexion base de données  

---

## 6️⃣ Déploiement Automatique (CD)

À chaque :

git push origin main

Alors :

1. GitHub Actions reconstruit l’image Docker  
2. L’image est poussée sur Docker Hub  
3. Render redéploie automatiquement  

---

## ✔️ Résultat Final

Votre projet est :

- 🟢 Buildé automatiquement  
- 🟢 Poussé sur Docker Hub  
- 🟢 Déployé sur Render  
- 🟢 Accessible en ligne publiquement  
