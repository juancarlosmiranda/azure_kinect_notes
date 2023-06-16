#!/bin/bash
# Project: AK_ACQS Azure Kinect Acquisition System https://github.com/GRAP-UdL-AT/ak_acquisition_system
#
# * PAgFRUIT http://www.pagfruit.udl.cat/en/
# * GRAP http://www.grap.udl.cat/
#
# Author: Juan Carlos Miranda. https://github.com/juancarlosmiranda

# Remove old packages and make cleaning of the system.
apt-get update
apt-get autoremove
apt-get autoclean

# Install essential tools
apt-get install build-essential
apt-get install cmake
apt-get install libgtk2.0-dev
apt-get install libusb-1.0
apt-get install ffmpeg
apt-get install mlocate
apt-get install locate
apt install curl

# Install repositories Ubuntu 20.04 and Ubuntu 18.04
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc
sudo apt-add-repository https://packages.microsoft.com/ubuntu/20.04/prod
sudo apt-get update

curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo apt-add-repository https://packages.microsoft.com/ubuntu/18.04/prod
curl -sSL https://packages.microsoft.com/config/ubuntu/18.04/prod.list | sudo tee /etc/apt/sources.list.d/microsoft-prod.list
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo apt-get update

#Install new package from repository
sudo apt-get update
sudo apt-get install libk4a1.4
sudo apt install libk4a1.4-dev
sudo apt install k4a-tools

# Copy rules
sudo cp 99-k4a.rules /etc/udev/rules.d/





