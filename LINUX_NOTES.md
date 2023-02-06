# Linux notes

This document contains instructions/notes on how to install Linux packages.


## 1. After install in Linux systems
In Linux systems you can install packages using Bash scripts, tested in Ubuntu 20.04. A super fast script for impatient people, copy and paste it!!!

### 1.1 Ubuntu 18.04


### 1.2 Ubuntu 20.04

### 1.3 Ubuntu 22.04

Remove old packages and make cleaning of the system. 
```
sudo apt-get update
sudo apt-get autoremove
sudo apt-get autoclean
```

Install network tools
```
sudo apt install net-tools
sudo apt-get install openssh-server
sudo systemctl enable ssh --now
sudo systemctl start ssh

```

Install essential tools that are not part of package, but these are useful after a default installation in Ubuntu 20.04 systems. If you have
installed some of them, ignore this paragraph.

```
sudo apt-get install build-essential
sudo apt-get install cmake
sudo apt-get install libgtk2.0-dev
sudo apt-get install libusb-1.0
sudo apt-get install ffmpeg
sudo apt-get install mlocate
sudo apt-get install locate
sudo apt install curl
sudo apt install git
```

## Authorship
Please contact author to report bugs juancarlos.miranda@udl.cat

## Citation
If you find this code useful, please consider citing:
[https://github.com/juancarlosmiranda/azure_kinect_notes](https://github.com/juancarlosmiranda/azure_kinect_notes).