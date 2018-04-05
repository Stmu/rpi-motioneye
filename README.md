# rpi-motioneye

[![Build Status](https://travis-ci.org/Stmu/rpi-motioneye.svg?branch=master)](https://travis-ci.org/Stmu/rpi-motioneye)


# Prepare the Raspberry Pi
* install docker
* Configure the Raspberry PI Camera Module 
  * connect the camera to the right port; the Raspberry PI has two identical ports for the camera module and for the touchscreen)
  * the cable/ribbon/connector is properly connected and not damaged
  * load the **bcm2835-v4l2** kernel module, by adding it to /etc/modules and rebooting afterwards
  * enable the camera using raspi-config
  * allocate at least 128 MB of RAM to the GPU
  * use a genuine camera module, not a "compatible" one
  * the command raspistill -o cam.jpg captures an image from the camera, without complaining
  * The special file /dev/video0 should be present when all of the above are met.

# Start motioneye with Docker
* docker pull stmu/rpi-motioneye

```sh
  docker run -d --name motioneye --privileged --device=/dev/video0 -v motion:/etc/motioneye -p  8765:8765 stmu/rpi-motioneye
```
