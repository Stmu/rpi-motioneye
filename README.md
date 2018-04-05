# rpi-motioneye

[![Build Status](https://travis-ci.org/Stmu/rpi-motioneye.svg?branch=master)](https://travis-ci.org/Stmu/rpi-motioneye)


# Prepare the raspberry host
* install docker
* Raspberry PI Camera Module Not Detected
  * Make sure that:

  * you have connected the camera to the right port; the Raspberry PI has two identical ports for the camera module and for the touchscreen)
  * the cable/ribbon/connector is properly connected and not damaged
  * you have loaded the **bcm2835-v4l2** kernel module, by adding it to /etc/modules and rebooting afterwards
  * you have enabled the camera using raspi-config
  * you have allocated at least 128 MB of RAM to the GPU
  * you are using a genuine camera module, not a "compatible" one
  * the command raspistill -o cam.jpg captures an image from the camera, without complaining
  * The special file /dev/video0 should be present when all of the above are met.

# start motion eye with docker
* docker pull stmu/rpi-motioneye

```sh
  docker run -d --name motioneye --privileged --device=/dev/video0 -v motion:/etc/motioneye -p  8765:8765 stmu/rpi-motioneye
```
