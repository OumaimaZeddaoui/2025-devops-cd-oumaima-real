# ============================
# 1) Build stage (Maven + JDK)
# ============================
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app

# Copier le pom.xml et télécharger les dépendances
COPY pom.xml .
RUN mvn dependency:go-offline

# Copier le code source
COPY src ./src

# Build l’application et produire le .jar
RUN mvn clean package -DskipTests


# ============================
# 2) Runtime stage (JDK léger)
# ============================
FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copier uniquement le jar depuis le stage builder
COPY --from=builder /app/target/*.jar app.jar

# Commande de lancement
ENTRYPOINT ["java", "-jar", "app.jar"]
