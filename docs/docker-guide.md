# 🐳 Guide Docker – Projet Spring Boot

## 1️⃣ Construire l’image Docker
La commande pour builder l’image localement :

docker build -t spring-app .
---

## 2️⃣ Lancer l'application en local
Si vous n'utilisez pas la base de données :

docker run -p 8080:8080 spring-app
---

## 3️⃣ Lancer avec la base PostgreSQL Neon (local)

docker run -p 8080:8080 ^
-e DATABASE_JDBC_URL="jdbc:postgresql://.../neondb?user=...&password=...&sslmode=require" ^
spring-app
---

## 4️⃣ Docker Compose (optionnel)mais cette resultat avant de fire le vrai lien dans la pr
Pour lancer l'app + une base PostgreSQL locale :

docker-compose up --build
---

## 5️⃣ Structure du Dockerfile

- Étape 1 : build Maven
- Étape 2 : image finale légère
- Copie du `.jar`
- Exposition du port 8080
- Commande d'exécution : `java -jar app.jar`

---

## ✔️ Résultat Final

Ce guide explique :
- Comment builder l’image
- Comment exécuter le conteneur
- Comment utiliser PostgreSQL local ou Neon
- Comment utiliser Docker Compose
