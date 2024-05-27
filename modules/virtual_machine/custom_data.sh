#!/bin/bash

sudo chmod +x $0
sudo wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install blobfuse
sudo touch fuse_connection.cfg
echo "accountName ${storage_account_name}" | sudo tee -a fuse_connection.cfg
echo "accountKey ${ACCOUNT_KEY}" | sudo tee -a fuse_connection.cfg
echo "containerName ${container_name}" | sudo tee -a fuse_connection.cfg
sudo chmod 600 fuse_connection.cfg 
sudo mkdir -p mycontainer
sudo blobfuse mycontainer --tmp-path=/mnt/resource/blobfusetmp --config-file=fuse_connection.cfg -o attr_timeout=240 -o entry_timeout=240 -o negative_timeout=120
sudo bash -c 'cd mycontainer && mkdir test && echo "hello world" > test/blob.txt'







