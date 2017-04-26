FROM debian
MAINTAINER Adam Griffiths

# List of dependencies from https://github.com/pfalcon/esp-open-sdk

RUN apt-get update && apt-get install -y make unrar-free autoconf automake libtool gcc g++ gperf \
    flex bison texinfo gawk ncurses-dev libexpat-dev python-dev python python-serial \
    sed git unzip bash help2man wget bzip2 libtool-bin

#install screen and minicom for debugging
RUN apt-get update && apt-get install -y screen
