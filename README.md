![SOFTWARE_PRESENTATION](https://github.com/juancarlosmiranda/azure_kinect_notes/blob/main/img/azure_kinect_notes_presentation.png?raw=true)


# README - Azure Kinect Setup

This document contains instructions/notes on how to install the Azure Kinect camera.
Here we collect experiences that have arisen with the development of [AK_SM_RECORDER](https://pypi.org/project/ak-sm-recorder/). A Python-based recorder for use with the Azure Kinect DK camera, if you find this useful let me know.

This is not intended to replace official documents, it is produced as a complementary guide in my learning.
Official Microsoft documents can be found at:

* [Azure Kinect DK documentation](https://docs.microsoft.com/en/azure/kinect-dk/)
* [Azure Kinect Sensor SDK download](https://docs.microsoft.com/en/azure/kinect-dk/sensor-sdk-download)

Official tools to manage the camera and sensors can be found in:
* [Azure Kinect viewer](https://docs.microsoft.com/en/azure/kinect-dk/azure-kinect-viewer)
* [Azure Kinect recorder](https://docs.microsoft.com/en/azure/kinect-dk/azure-kinect-recorder)
* [Azure Kinect firmware tool](https://docs.microsoft.com/en/azure/kinect-dk/azure-kinect-firmware-tool)


This document is organized as following:
* 1. Fast setup using scripts in Linux systems.
* 2. Installing in Linux environments.
* 3. Installing in Windows 10 environments.
* 4. Using manufacturer tools: ka4viewer, recorder.    

## 1. Fast setup using scripts in Linux systems
In Linux systems you can install packages using Bash scripts, tested in Ubuntu 20.04. A super fast script for impatient people, copy and paste it!!!
```
git clone https://github.com/juancarlosmiranda/azure_kinect_notes.git && cd azure_kinect_notes && chmod 755 install_azure_kinect_camera.sh
```

Check the camera with this tool **[k4aviewer](https://docs.microsoft.com/en/azure/kinect-dk/azure-kinect-viewer)**.
```
sudo k4aviewer
```



## 2. Installing in Linux environments
Follow these instructions if you want to see the installation process step by step.
Essential tools that are not part of the package, but are useful after a default installation on Ubuntu 20.04 systems. if you have
installed some of them, ignore this paragraph.
The official site of the SDK in Gihub is [Using Azure Kinect SDK](https://github.com/microsoft/Azure-Kinect-Sensor-SDK/blob/develop/docs/usage.md)
Please consider to take note about special issues in [Linux Devide Setup](https://github.com/microsoft/Azure-Kinect-Sensor-SDK/blob/develop/docs/usage.md#linux-device-setup) section.

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

Remove old packages to avoid conflicts 
```
sudo apt remove libk4a*
sudo apt remove libk4abt*
sudo apt remove libk4a1*
```

Install repositories Ubuntu 22.04
```
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc
sudo apt-add-repository https://packages.microsoft.com/ubuntu/22.04/prod
sudo apt-get update
```

wget mirrors.kernel.org/ubuntu/pool/universe/libs/libsoundio/libsoundio1_1.2-1_amd64.deb


Install repositories Ubuntu 20.04
```
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc
sudo apt-add-repository https://packages.microsoft.com/ubuntu/20.04/prod
sudo apt-get update
```
Install repositories Ubuntu 18.04
```
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo apt-add-repository https://packages.microsoft.com/ubuntu/18.04/prod
curl -sSL https://packages.microsoft.com/config/ubuntu/18.04/prod.list | sudo tee /etc/apt/sources.list.d/microsoft-prod.list
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo apt-get update
```

Install new package from repository
```
sudo apt-get update
sudo apt-get install libk4a1.4
sudo apt install libk4a1.4-dev
sudo apt install k4a-tools
```

Copy file "99-k4a.rules to" present in this repository to /etc/udev/rules.d, this is necessary for
us Azure Kinect tools without be root user. The file is saved in this repository.
```
sudo cp 99-k4a.rules /etc/udev/rules.d/
```

Testing with tool **[k4aviewer](https://docs.microsoft.com/en/azure/kinect-dk/azure-kinect-viewer)**.
```
sudo k4aviewer
```
![k4aviewer](https://github.com/juancarlosmiranda/azure_kinect_notes/blob/main/img/k4aviewer_tool.png?raw=true)

You can check installed software with:
```
sudo apt list -a libk4a*
sudo apt list -a libk4abt1.1
sudo apt list -a libk4abt1.1-dev
```

If you prefer Python, you can install [pyk4a Python Library](https://github.com/etiennedub/pyk4a)
to manage the camera and sensors.

```
pip install pyk4a
```

**IMPORTANT NOTE **
DON'T FORGET copy this file "99-k4A.rules"
[Linux Device Setup](https://github.com/microsoft/Azure-Kinect-Sensor-SDK/blob/develop/docs/usage.md#linux-device-setup)

** ...
**Linux Device Setup**

On Linux, once attached, the device should automatically enumerate and load all drivers. However, in order to use the Azure Kinect SDK with the device and without being 'root', you will need to setup udev rules. We have these rules checked into this repo under 'scripts/99-k4a.rules'. To do so:

    Copy 'scripts/99-k4a.rules' into '/etc/udev/rules.d/'.
    Detach and reattach Azure Kinect devices if attached during this process.

Once complete, the Azure Kinect camera is available without being 'root'.
...
***


## 3. Installing in Windows 10 environments (PENDING).

This section will be updated in the next iterations.

* (Windows installation instructions)[https://github.com/microsoft/Azure-Kinect-Sensor-SDK/blob/develop/docs/usage.md]

* (Azure Kinect SDK v1.4.1.exe)[https://download.microsoft.com/download/3/d/6/3d6d9e99-a251-4cf3-8c6a-8e108e960b4b/Azure%20Kinect%20SDK%201.4.1.exe]

## 4. Using manufacturer tools: ka4viewer, recorder.

Official tools to manage the camera and sensors can be found in:
* [Azure Kinect viewer](https://docs.microsoft.com/en/azure/kinect-dk/azure-kinect-viewer)
* [Azure Kinect recorder](https://docs.microsoft.com/en/azure/kinect-dk/azure-kinect-recorder)



## Authorship
Please contact author to report bugs juancarlos.miranda@udl.cat

## Citation
If you find this code useful, please consider citing:
[https://github.com/juancarlosmiranda/azure_kinect_notes](https://github.com/juancarlosmiranda/azure_kinect_notes).