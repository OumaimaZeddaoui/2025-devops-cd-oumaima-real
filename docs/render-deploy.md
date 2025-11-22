# 🚀 Déploiement Render – Guide Complet

## 1️⃣ Préparer le projet
Avant de déployer, assurez-vous que votre projet contient :
- Un Dockerfile fonctionnel
- Le code Spring Boot
- Une image publiée automatiquement par GitHub Actions (CI)

---

## 2️⃣ Créer le Web Service Render
1. Aller sur : https://dashboard.render.com  
2. Cliquer **New → Web Service**
3. Choisir **Build & Deploy from GitHub**
4. Sélectionner le repo : `2025-devops-cd-oumaima-real`

---

## 3️⃣ Configuration Render

### 🔧 Build Command

./mvnw clean package -DskipTests

### 🔧 Start Command

java -jar target/*.jar

### 🔧 Environment
- Environment = Docker
- Render détecte automatiquement le Dockerfile
- Le port utilisé est `${PORT}` (ajouté automatiquement par Render)

---

## 4️⃣ Tester le déploiement
Render fournit une URL du type :

https://spring-app-latest-xxxxx.onrender.com


Elle doit afficher la page d’accueil Spring Boot.

---

## 5️⃣ Vérifier les logs
Aller dans **Logs** sur Render :

Vous devez voir :
- `Tomcat started on port`
- `Started TpCd2024Application`

Si erreurs → vérifier :
- Dockerfile
- Variables d’environnement
- Base de données

---

## 6️⃣ Déploiement Automatique (CD)

Chaque :

git push origin main

➜ GitHub Actions reconstruit l’image Docker  
➜ L’image est poussée sur Docker Hub  
➜ Render redéploie automatiquement  

---

## ✔️ Résultat Final
Votre application Spring Boot est :
- 🟢 Buildée automatiquement
- 🟢 Poussée sur Docker Hub
- 🟢 Déployée sur Render
- 🟢 Accessible publiquement
