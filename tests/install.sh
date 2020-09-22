#!/bin/bash

set -e

if [[ ! $(uname -m) =~ ^arm* ]]; then
  source /etc/lsb-release
  case "$DISTRIB_ID" in
  Ubuntu)
    sudo apt-get update
    sudo apt-get install -y python3 python3-pip
    # https://docs.opencv.org/master/d7/d9f/tutorial_linux_install.html
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev
    # https://stackoverflow.com/questions/55313610/importerror-libgl-so-1-cannot-open-shared-object-file-no-such-file-or-directo
    sudo apt-get install -y ffmpeg libsm6 libxext6 libgl1-mesa-glx
    python3 -m pip install --upgrade pip
    python3 -m pip install -r https://raw.githubusercontent.com/luxonis/depthai/develop/requirements.txt
    ;;
  *) ;;

  esac
elif [[ $(uname -m) =~ ^arm* ]]; then
  sudo apt-get update
  sudo apt-get install -y python3 python3-pip
  # https://docs.opencv.org/master/d7/d9f/tutorial_linux_install.html
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
  # https://stackoverflow.com/questions/55313610/importerror-libgl-so-1-cannot-open-shared-object-file-no-such-file-or-directo
  sudo apt-get install -y ffmpeg libsm6 libxext6 libgl1-mesa-glx
  # https://stackoverflow.com/a/53402396/5494277
  sudo apt-get install -y libhdf5-dev libhdf5-dev libatlas-base-dev libjasper-dev libqtgui4 libqt4-test
  # https://github.com/EdjeElectronics/TensorFlow-Object-Detection-on-the-Raspberry-Pi/issues/18#issuecomment-433953426
  sudo apt-get install -y libilmbase-dev libopenexr-dev libgstreamer1.0-dev
  python3 -m pip install --upgrade pip
  python3 -m pip install -r https://raw.githubusercontent.com/luxonis/depthai/develop/requirements.txt
fi
