FROM resin/rpi-raspbian:stretch
MAINTAINER Stefan Mueller <stmu@stmu.net>

RUN apt-get update && \
    apt-get install -f build-essential python curl \ 
    libmariadbclient18 libpq5 \
    python-pip python-dev libssl-dev libcurl4-openssl-dev libjpeg-dev python-setuptools \
    zlib1g-dev \
    v4l-utils ffmpeg \
    wget libraspberrypi-bin git

RUN wget https://github.com/Motion-Project/motion/releases/download/release-4.1.1/pi_stretch_motion_4.1.1-1_armhf.deb
RUN dpkg -i pi_stretch_motion_4.1.1-1_armhf.deb
RUN echo "bcm2835-v4l2" >> /etc/modules

RUN pip install motioneye
RUN mkdir -p /etc/motioneye
RUN cp /usr/local/share/motioneye/extra/motioneye.conf.sample /etc/motioneye/motioneye.conf

RUN mkdir -p /var/lib/motioneye

VOLUME /etc/motioneye
VOLUME /var/lib/motioneye

EXPOSE 8765

CMD ["/usr/local/bin/meyectl", "startserver",  "-c", "/etc/motioneye/motioneye.conf"]
