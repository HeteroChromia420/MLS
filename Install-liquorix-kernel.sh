#! /bin/bash
curl 'https://liquorix.net/add-liquorix-repo.sh' | sudo bash
sudo apt update
sudo apt-get install linux-image-liquorix-amd64 linux-headers-liquorix-amd64