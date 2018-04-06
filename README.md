# rpi-motioneye

[![Build Status](https://travis-ci.org/Stmu/rpi-motioneye.svg?branch=master)](https://travis-ci.org/Stmu/rpi-motioneye)


# Prepare the Raspberry Pi
* Install Docker
* Configure the Raspberry PI Camera Module 
  * Connect the camera to the right port; the Raspberry PI has two identical ports for the camera module and for the touchscreen)
  * Load the **bcm2835-v4l2** kernel module, by adding it to /etc/modules and rebooting afterwards
  * Enable the camera using raspi-config
  * Allocate at least 128 MB of RAM to the GPU
  * The special file **/dev/video0** should be present

# Start motioneye with Docker
* docker pull stmu/rpi-motioneye

```sh
  docker run -d --name motioneye --restart=always --privileged --device=/dev/video0 -v motion:/etc/motioneye -p  8765:8765 stmu/rpi-motioneye
```
