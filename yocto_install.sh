#!/bin/bash
#echo | sudo apt update
#echo | sudo apt upgrade

sudo apt install -y bc build-essential chrpath cpio diffstat gawk git texinfo wget gdisk python3 python3-pip liblz4-tool
sudo apt install -y libssl-dev

echo "alias python=python3" >> ~/.bashrc
sourch ~/.bashrc
python --version

mkdir yocto
cd yocto

git clone https://github.com/yoctoproject/poky.git
git clone https://github.com/STMicroelectronics/meta-st-stm32mp.git
git clone https://github.com/openembedded/meta-openembedded.git

cd poky/
git checkout kirkstone
cd ../meta-st-stm32mp/
git checkout kirkstone
cd ../meta-openembedded/
git checkout kirkstone

cd ..
source poky/oe-init-build-env buildmp1

bitbake-layers show-layers
