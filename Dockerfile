FROM resin/rpi-raspbian:jessie
MAINTAINER Stefan Mueller <stmu@stmu.net>

RUN apt-get update && apt-get install -f build-essential python-pip python-dev curl libssl-dev libcurl4-openssl-dev libjpeg-dev libx264-142 libavcodec56 libavformat56 libmysqlclient18 libswscale3 libpq5 wget libraspberrypi-bin

# ffmpeg install
RUN wget https://github.com/ccrisan/motioneye/wiki/precompiled/ffmpeg_3.1.1-1_armhf.deb
RUN dpkg -i ffmpeg_3.1.1-1_armhf.deb

RUN wget https://github.com/Motion-Project/motion/releases/download/release-4.0.1/pi_jessie_motion_4.0.1-1_armhf.deb
RUN dpkg -i pi_jessie_motion_4.0.1-1_armhf.deb

RUN echo "bcm2835-v412" >> /etc/modules

RUN pip install motioneye
RUN mkdir -p /etc/motioneye
RUN cp /usr/local/share/motioneye/extra/motioneye.conf.sample /etc/motioneye/motioneye.conf

RUN mkdir -p /var/lib/motioneye

VOLUME /etc/motioneye
VOLUME /var/lib/motioneye

EXPOSE 8765

CMD ["/usr/local/bin/meyectl", "startserver",  "-c", "/etc/motioneye/motioneye.conf"]
