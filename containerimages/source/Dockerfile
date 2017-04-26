FROM $dependencies
MAINTAINER Adam Griffiths

# because crosstool-NG can't compile as root
RUN useradd -ms /bin/bash builduser

#allow builduser to access /dev/ttyUSB0 via the group "staff"
RUN usermod -a -G staff builduser

#default to builduser
USER builduser
WORKDIR /home/builduser

RUN git clone --recursive https://github.com/pfalcon/esp-open-sdk.git;
