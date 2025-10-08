# Étape 1 : builder l’application
FROM node:20-alpine AS builder

# Définir le dossier de travail
WORKDIR /app

# Copier les fichiers nécessaires
COPY package*.json ./
RUN npm install

COPY . .

# Builder le projet (optionnel, mais possible pour un déploiement prod)
RUN npm run build

# Étape 2 : image de production légère avec un serveur HTTP statique
FROM nginx:alpine

# Copier les fichiers générés dans le dossier du serveur nginx
COPY --from=builder /app/dist /usr/share/nginx/html

# Exposer le port
EXPOSE 80

# Lancer nginx
CMD ["nginx", "-g", "daemon off;"]
