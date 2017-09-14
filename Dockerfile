FROM resin/rpi-raspbian:stretch
MAINTAINER Stefan Mueller <stmu@stmu.net>

RUN apt-get update && apt-get install -f build-essential python-pip python-setuptools python-dev curl libssl-dev default-libmysqlclient-dev libcurl4-openssl-dev libjpeg-dev libx264-148 libavcodec57 libavformat57 libswscale4 libpq5 wget libraspberrypi-bin git

# ffmpeg install
RUN wget https://github.com/ccrisan/motioneye/wiki/precompiled/ffmpeg_3.1.1-1_armhf.deb
RUN dpkg -i ffmpeg_3.1.1-1_armhf.deb

RUN wget https://github.com/Motion-Project/motion/releases/download/release-4.0.1/pi_stretch_motion_4.0.1-1_armhf.deb
RUN dpkg -i pi_stretch_motion_4.0.1-1_armhf.deb

RUN echo "bcm2835-v4l2" >> /etc/modules

RUN git clone https://github.com/ccrisan/motioneye.git 

RUN pip install wheel
RUN python -m pip install tornado
RUN python -m pip install Pillow
#RUN pip install motioneye
RUN mkdir -p /etc/motioneye
#RUN cp /usr/local/share/motioneye/extra/motioneye.conf.sample /etc/motioneye/motioneye.conf
RUN cp /motioneye/extra/motioneye.conf.sample /etc/motioneye/motioneye.conf

RUN mkdir -p /var/lib/motioneye

VOLUME /etc/motioneye
VOLUME /var/lib/motioneye

EXPOSE 8765

CMD ["python", "/motioneye/motioneye/motionctl.py", "startserver",  "-c", "/etc/motioneye/motioneye.conf"]
