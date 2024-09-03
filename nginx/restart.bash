#!/bin/bash

# Définir le chemin de l'application
APP_PATH="/home/zei/Documents/Eccentric-Bard/apps/web/public"

# Définir le chemin du fichier de configuration dans le monorepo
CONFIG_PATH="/home/zei/Documents/Eccentric-Bard/nginx/eccentricbard.conf"

# Supprimer le fichier de configuration Nginx existant (si nécessaire)
if [ -L /etc/nginx/conf.d/eccentricbard.conf ] || [ -f /etc/nginx/conf.d/eccentricbard.conf ]; then
    sudo rm /etc/nginx/conf.d/eccentricbard.conf
fi

# Créer un lien symbolique vers le fichier de configuration Nginx
sudo ln -s $CONFIG_PATH /etc/nginx/conf.d/eccentricbard.conf

# Redémarrer Nginx
sudo systemctl restart nginx

echo "Configuration Nginx déployée et Nginx redémarré."
