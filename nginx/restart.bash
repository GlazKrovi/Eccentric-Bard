#!/bin/bash

# Définir le chemin de l'application
APP_PATH="/home/zei/Documents/Eccentric-Bard/apps/web/public"

# Définir le chemin du fichier de configuration dans le monorepo
APP_CONFIG_PATH="/home/zei/Documents/Eccentric-Bard/nginx/eccentricbard.conf"  # from monorepo
CONFIG_PATH="/etc/nginx/conf.d/default.conf"   # into machine

# Supprimer le fichier de configuration Nginx existant (si nécessaire)
if [ -L $CONFIG_PATH ] || [ -f $CONFIG_PATH ]; then
    sudo rm $CONFIG_PATH
fi

# Copier la configuration de l'application vers le dossier Nginx
sudo cp $APP_CONFIG_PATH $CONFIG_PATH
sudo chmod 777 $APP_CONFIG_PATH 
sudo chmod 777 $CONFIG_PATH  

# Redémarrer Nginx
sudo systemctl restart nginx

echo "Configuration Nginx déployée et Nginx redémarré."
