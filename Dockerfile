FROM resin/rpi-rasbian:jessie
MAINTAINER Stefan Mueller <stmu@stmu.net>

# ffmpeg install
RUN wget https://github.com/ccrisan/motioneye/wiki/precompiled/ffmpeg_3.1.1-1_armhf.deb
RUN dpkg -i ffmpeg_3.1.1-1_armhf.deb

RUN apt-get install -f python-pip python-dev curl libssl-dev libcurl4-openssl-dev libjpeg-dev libx264-142 libavcodec56 libavformat56 libmysqlclient18 libswscale3 libpq5

RUN wget https://github.com/Motion-Project/motion/releases/download/release-4.0.1/pi_jessie_motion_4.0.1-1_armhf.deb
RUN dpkg -i pi_jessie_motion_4.0.1-1_armhf.deb

RUN pip install motioneye
RUN mkdir -p /etc/motioneye
RUN cp /usr/local/share/motioneye/extra/motioneye.conf.sample /etc/motioneye/motioneye.conf

RUN mkdir -p /var/lib/motioneye
EXPOSE 8765

CMD ["meyectl", "startserver -c /path/to/motioneye/motioneye.conf"]

