#!/bin/bash
sudo apt update -y
sudo apt upgrade -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible
