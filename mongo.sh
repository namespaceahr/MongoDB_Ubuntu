#!/bin/bash
#scriptByNamespaceahr
read -r -p "Are you sure want to install MongoDB ? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
 sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
if [[ `$ lsb_release -r` == "12.04" ]] 
then
echo "deb http://repo.mongodb.org/apt/ubuntu precise/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
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
fi

if [[ `$ lsb_release -r` == "14.04" ]] 
then
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
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
fi
else
    echo "Thank you"
fi