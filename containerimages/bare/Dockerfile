FROM $source
MAINTAINER Adam Griffiths

RUN cd esp-open-sdk; \
  make STANDALONE=n; \
  cd ..;

ENV PATH "$PATH:/home/builduser/esp-open-sdk/xtensa-lx106-elf/bin"
