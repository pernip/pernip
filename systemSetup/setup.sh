#!/usr/bin/env bash
# Requies a few clicks to confirm some installs (so missing -y autoconfirm in a few places)
# And at least one restart, so this is not a fully automated shell script
# So you'll need to copy and paste commands into the terminal

sudo apt update
sudo apt install vim -y
sudo apt-get install obs-studio -y
sudo apt-get install ubuntu-restricted-extras
sudo apt install gnome-tweaks
sudo apt install python3-pip -y
sudo apt install software-properties-common
sudo apt install python3-dev python3-pip
sudo pip3 install -U virtualenv
sudo apt-get install python3-tk -y
sudo snap install pycharm-community --classic

# did I need to reboot before doing this?
sudo apt install pulseaudio -y
sudo apt-get install vlc


# --------------------------------------------------- TENSOR FLOW GPU ---------------------------------------------------------

# I followed https://www.tensorflow.org/install/gpu which had two issues
# 1) Installing graphics driver nvidia-driver-410 seemed to be missing a depency and installing the depency seemed problematic
# I used nvidia-driver-418
# 2) sudo apt-get install -y --no-install-recommends libnvinfer-dev=5.0.2-1+cuda10.0 line did not run
# found solution at https://devtalk.nvidia.com/default/topic/1049920/trouble-installing-tensorrt-5-1-rc-for-tensorflow-1-13-1/
# which recomended sudo apt-get install -y --no-install-recommends libnvinfer5=5.1.2-1+cuda10.0
# this seems to have worked

sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt-get update

# Add NVIDIA package repositories
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.0.130-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804_10.0.130-1_amd64.deb
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
sudo apt-get update
wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
sudo apt install ./nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
sudo apt-get update

# Install NVIDIA driver
sudo apt-get install nvidia-driver-418 -y

# Reboot. Here. Check that GPUs are visible using the command: nvidia-smi

# Install development and runtime libraries (~4GB)
sudo apt-get install --no-install-recommends \
    cuda-10-0 \
    libcudnn7=7.4.1.5-1+cuda10.0  \
    libcudnn7-dev=7.4.1.5-1+cuda10.0

# Install TensorRT. Requires that libcudnn7 is installed above.
sudo apt-get update
sudo apt-get install nvinfer-runtime-trt-repo-ubuntu1804-5.0.2-ga-cuda10.0
sudo apt-get update

sudo apt-get install -y --no-install-recommends libnvinfer5=5.1.2-1+cuda10.0


# -----------------------------------------------------------------------------------------------------------------------------

# More system setup
sudo apt install git -y
sudo apt install curl -y
sudo apt-get install cpu-checker -y
sudo apt install cpu-checker -y

# ------------------------------------------- Installing flutter --------------------------------------------------

curl https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.2.1-stable.tar.xz --output /home/troy/Downloads/flutter_linux_v1.2.1-stable.tar.xz
mkdir ~/development
cd ~/development
tar xf ~/Downloads/flutter_linux_v1.2.1-stable.tar.xz


echo  'export PATH="$PATH:/home/troy/development/flutter/bin"' >> ~/.bashrc
source $HOME/.bash_profile


sudo snap install android-studio --classic


$ sudo apt-get install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils -y
# thanks to https://stackoverflow.com/questions/37300811/android-studio-dev-kvm-device-permission-denied
sudo adduser $USER kvm

# needs to be manually accepted
flutter doctor --android-licenses