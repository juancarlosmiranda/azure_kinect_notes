#!/bin/bash
# Project: AK_ACQS Azure Kinect Acquisition System https://github.com/GRAP-UdL-AT/ak_acquisition_system
#
# * PAgFRUIT http://www.pagfruit.udl.cat/en/
# * GRAP http://www.grap.udl.cat/
#
# Author: Juan Carlos Miranda. https://github.com/juancarlosmiranda

# Remove old packages and make cleaning of the system.
sudo apt-get update
sudo apt-get autoremove
sudo apt-get autoclean

# Install essential tools
sudo apt-get install -y build-essential
sudo apt-get install -y cmake
sudo apt-get install -y libgtk2.0-dev
sudo apt-get install -y libusb-1.0
sudo apt-get install -y ffmpeg
sudo apt-get install -y mlocate
sudo apt-get install -y locate
sudo apt install -y curl

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
sudo apt-get install -y libk4a1.4
sudo apt install -y libk4a1.4-dev
# https://packages.ubuntu.com/focal/amd64/libsoundio1/download
# download from mirror libsoundio1, it is a dependence of k4a-tools
wget mirrors.kernel.org/ubuntu/pool/universe/libs/libsoundio/libsoundio1_1.1.0-1_amd64.deb
sudo dpkg -i libsoundio1_1.1.0-1_amd64.deb
sudo apt install -y k4a-tools

# Copy rules
sudo cp 99-k4a.rules /etc/udev/rules.d/





