#!/usr/bin/env bash

echo "
----------------------
  MONGODB
----------------------
"
sudo apt-get install wget
# import mongodb 4.0 public gpg key
if [wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -]
then
    # create the /etc/apt/sources.list.d/mongodb-org-4.0.list file for mongodb
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
else
    sudo apt-get install gnupg    
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
fi    

# reload local package database
sudo apt-get update

# install the latest version of mongodb
sudo apt-get install -y mongodb-org

# start mongodb
sudo systemctl start mongod

# set mongodb to start automatically on system startup
sudo systemctl enable mongod