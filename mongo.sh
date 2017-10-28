#!/bin/bash
#scriptByNamespaceahr
while true; do
    read -p "Do you wish to install MongoDB 3.0 by Shamrat ?" yn
    case $yn in
        [Yy]* ) make install; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
if [[ `lsb_release -rs` == "12.04" ]] 
then
echo "deb http://repo.mongodb.org/apt/ubuntu precise/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
fi

if [[ `lsb_release -rs` == "14.04" ]] 
then
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
fi

sudo apt-get update
sudo apt-get install -y mongodb-org
sudo apt-get install -y mongodb-org=3.0.15 mongodb-org-server=3.0.15 mongodb-org-shell=3.0.15 mongodb-org-mongos=3.0.15 mongodb-org-tools=3.0.15

echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-org-shell hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections

sudo service mongod start
echo "<port> is the port configured in /etc/mongod.conf, 27017 by default."