#!/bin/bash

module_to_update=$1
database_name=${2:-"odoo17-ce"}
docker_name=${3:-"odoo17-web"}
addons_path=${4:-"../odoo-addons/addons-customs"}

cd $addons_path
sudo git reset --hard HEAD
sudo git pull --rebase

if [ ! -z "${module_to_update}" ]; then
    sudo docker exec -it $docker_name /bin/bash -c "/mnt/odoo/odoo-bin --config=/etc/odoo/odoo.conf --logfile=/var/log/odoo/odoo-server.log --http-port=9999 -d $database_name -u $module_to_update --stop-after-init"
    echo "Release finished! Updated module $module_to_update"

else
    echo "No module specified for update, skipping update step"
fi

sudo docker restart $docker_name