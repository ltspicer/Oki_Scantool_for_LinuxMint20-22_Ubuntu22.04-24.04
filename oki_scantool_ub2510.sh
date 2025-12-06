#!/bin/bash

echo "##################################################################################################"
echo "#################################       for Kubuntu 25.10       ##################################"
echo "#################################    Oki-Scan-Tool Installer    ##################################"
echo "#################################   (C) 2025 Daniel Luginbühl   ##################################"
echo "#################################      www.ltspiceusers.ch      ##################################"
echo "##################################################################################################"
echo

# Many thanks to BassHero
# https://github.com/BassHero/okimfpsdrv
# This script is an extension that also installs the Oki scan tool.

# Current version see: https://archive.ubuntu.com/ubuntu/pool/universe/p/python2.7/
version="1.5"

# URL to repo
url="https://raw.github.com/ltspicer/Oki_Scantool_for_LinuxMint20-22_Ubuntu22.04-24.04/main"

# Working directory
directory="Downloads"

# Local download path
dl_path="oki_scan_driver"

# Oki scan driver & scan tool install script to ubuntu 24.04 and derivatives.
# Models: 
# CX2633 MFP; CX2731 MFP; ES3451 MFP; ES3452 MFP; ES3461 MFP; ES4172LP MFP; 
# ES4192 MFP; ES5162 MFP; ES5162LP MFP; ES5461 MFP; ES5462 MFP; ES5463 MFP; ES5473 MFP; 
# ES8451 MFP; ES8453 MFP; ES8461 MFP; ES8461+ MFP; ES8462 MFP; ES8463 MFP; ES8473 MFP; 
# ES8483 MFP; MB441; MB451; MB461; MB461+LP; MB471; MB472; MB491; MB491+LP; MB492; MB562; 
# MC332; MC342; MC351; MC352; MC361; MC362; MC363; MC561; MC562; MC563; MC573; MC851; 
# MC851+; MC852; MC853; MC860; MC861; MC861+; MC862; MC863; MC873; MC883; MPS2731mc; MPS4200mb

mkdir -p "$HOME/$directory"

echo
echo "I use ubuntu$version version. See: https://archive.ubuntu.com/ubuntu/pool/universe/p/python2.7"
echo
echo "I use folder: $HOME/$directory/$dl_path"
echo

sudo apt -y --fix-broken install

# Create python2-dummy in apt

cd $HOME/$directory
mkdir -p $dl_path/python2
cd $dl_path

set -e

echo "==> Install 'equivs', if not already present..."
sudo apt-get update
sudo apt-get install -y equivs

echo "==> Create working directory..."
mkdir -p python2-dummy
cd python2-dummy

echo "==> Create control file for dummy package..."
equivs-control python2-dummy

cat > python2-dummy <<EOF
Section: misc
Priority: optional
Standards-Version: 3.9.2

Package: python2
Version: 2.7.18
Provides: python2
Architecture: all
Maintainer: Dummy Maintainer <noreply@example.com>
Description: Dummy package to satisfy dependencies for manually installed Python 2.7.18
 This package exists only to satisfy package dependencies.
EOF

echo "==> Build dummy package..."
equivs-build python2-dummy

echo "==> Install dummy package..."
sudo dpkg -i python2_2.7.18_all.deb

echo "==> Done. 'python2' is now marked as installed for APT."

cd ..


# 1. Oki Scan Driver download files:

echo "Downloading driver..."

wget $url/okimfpdriver.deb

# The Original Oki driver can be downloaded on link:
# https://www.oki.com/printing/download/okimfpsdrv_1.7-0_amd64_231225.deb
# but it don't works. It causes dependency's problems with python.

echo "Installing Python2..."

mkdir -p python2    
cd python2

# python2 (2.7.18-3) [universe]
wget http://mirrors.kernel.org/ubuntu/pool/universe/p/python-defaults/python2_2.7.18-3_amd64.deb

# python2-minimal (= 2.7.18-3)
wget http://mirrors.kernel.org/ubuntu/pool/universe/p/python-defaults/python2-minimal_2.7.18-3_amd64.deb

# python2.7-minimal (>= 2.7.18~)
wget "http://security.ubuntu.com/ubuntu/pool/universe/p/python2.7/python2.7-minimal_2.7.18-13ubuntu${version}_amd64.deb"

# libpython2.7-minimal (= 2.7.18-13ubuntu1.1) [amd64, i386]
wget "http://security.ubuntu.com/ubuntu/pool/universe/p/python2.7/libpython2.7-minimal_2.7.18-13ubuntu${version}_amd64.deb"

# libpython2-stdlib (= 2.7.18-3)
wget http://mirrors.kernel.org/ubuntu/pool/universe/p/python-defaults/libpython2-stdlib_2.7.18-3_amd64.deb

# libpython2.7-stdlib (>= 2.7.18~) 
wget "http://security.ubuntu.com/ubuntu/pool/universe/p/python2.7/libpython2.7-stdlib_2.7.18-13ubuntu${version}_amd64.deb"

# python2.7 (>= 2.7.18~)
wget "http://security.ubuntu.com/ubuntu/pool/universe/p/python2.7/python2.7_2.7.18-13ubuntu${version}_amd64.deb"


# 2. Packages Installation

# 2.1 Dependencies

sudo apt -y --fix-broken install

sudo apt install libnsl2

# 2.1.1 python2-minimal and dependencies
sudo dpkg -i "libpython2.7-minimal_2.7.18-13ubuntu${version}_amd64.deb" "python2.7-minimal_2.7.18-13ubuntu${version}_amd64.deb" "python2-minimal_2.7.18-3_amd64.deb"

# 2.1.2 libpython2-stdlib and dependencies
sudo dpkg -i "libpython2.7-stdlib_2.7.18-13ubuntu${version}_amd64.deb" "libpython2-stdlib_2.7.18-3_amd64.deb"

# 2.1.3 python2.7 (>= 2.7.18~) dependency
sudo dpkg -i "python2.7_2.7.18-13ubuntu${version}_amd64.deb"

# 2.1.4 And finally, python2
sudo dpkg -i python2_2.7.18-3_amd64.deb

# Symlink python is python2
set +e
sudo ln -s /usr/bin/python2.7 /usr/bin/python

cd $HOME/$directory/$dl_path

# Get dependencies for okiscanntool
wget $url/libffi7_3.3-5ubuntu1_amd64.deb
wget $url/python-cairo_1.16.2-2ubuntu2_amd64.deb
wget $url/python-gobject-2_2.28.6-14ubuntu1_amd64.deb
wget $url/pygtk2.deb

# Install GTK2 + GDK-Pixbuf dependencies
sudo apt install -y libgdk-pixbuf2.0-0
if [ $? -ne 0 ]; then
    echo "Installation of libgdk-pixbuf2.0-0 failed. Installing deb packages from github..."
    wget $url/libgdk-pixbuf2.0-0_2.40.2-3build2_amd64.deb
    wget $url/libgdk-pixbuf2.0-dev_2.40.2-3build2_amd64.deb
    wget $url/libgdk-pixbuf-xlib-2.0-0_2.40.2-3build2_amd64.deb
    wget $url/libgdk-pixbuf-xlib-2.0-dev_2.40.2-3build2_amd64.deb

    # Install base packages in correct order
    sudo dpkg -i libgdk-pixbuf-xlib-2.0-0_2.40.2-3build2_amd64.deb
    sudo dpkg -i libgdk-pixbuf-xlib-2.0-dev_2.40.2-3build2_amd64.deb
    sudo dpkg -i libgdk-pixbuf2.0-0_2.40.2-3build2_amd64.deb
    sudo dpkg -i libgdk-pixbuf2.0-dev_2.40.2-3build2_amd64.deb
fi

# Install python packages
sudo dpkg -i libffi7_3.3-5ubuntu1_amd64.deb
sudo dpkg -i python-cairo_1.16.2-2ubuntu2_amd64.deb python-gobject-2_2.28.6-14ubuntu1_amd64.deb

# Install pygtk2
sudo dpkg -i pygtk2.deb
sudo apt --fix-broken install -y

set -e

# 2.2.1 Installing Oki Scan Driver

echo "Installing driver..."

sudo dpkg -i okimfpdriver.deb

rm -rf "$HOME/$directory/$dl_path"

echo ""
echo "Installation Finished! Do reboot now:"
echo ""
echo "sudo reboot"
echo ""
echo "After reboot enter:"
echo ""
echo "sudo okiscanadm"
echo ""
echo "to configure a network scanner."
echo "In some cases appears:"
echo ""
echo "* A network scanner has been added to this PC."
echo "Your PC could not be added to the MFP. (code=249)"
echo ""
echo "In this case the okiscanadm tool must be started a second time, delete the scanner and use okiscanadm again to configure the scanner."
echo ""
echo "This window closes in 10 seconds."
sleep 10
