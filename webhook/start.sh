#!/bin/sh

# Load kubectl config for access
kind export kubeconfig --name experimental

kind_ip=$(docker inspect --format='{{.NetworkSettings.Networks.kind.IPAddress}}' experimental-control-plane)
new_address="$(<<< "server: https://$kind_ip" sed -e 's`[][\\/.*^$]`\\&`g')"

old_address="server: https://127.0.0.1"
old_address="$(<<< $old_address sed -e 's`[][\\/.*^$]`\\&`g')"

sed -i -E "s/$old_address:[0-9]{4,5}/$new_address:6443/g"  /root/.kube/config 

# Load webhook
envsubst < webhook.template.json > webhook.json

webhook -hooks webhook.json -verbose -port 80 -urlprefix ""