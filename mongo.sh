#!/bin/bash
#scriptByNamespaceahr
read -r -p "Are you sure want to install MongoDB ? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
fi
OUTPUT="$(lsb_release -r)"
echo "${OUTPUT}"
