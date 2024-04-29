FROM quay.io/toolbx-images/debian-toolbox:10

LABEL com.github.containers.toolbox="true" \
      name="debian-tagdust-toolbox" \
      version="10" \
      usage="This image is meant to be used with the toolbox command" \
      summary="Debian toolbox container with tagdust installed" \
      maintainer=""

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install build-essential wget && \
    rm -rd /var/lib/apt/lists/*

RUN mkdir /src
WORKDIR /src
RUN wget https://downloads.sourceforge.net/project/tagdust/tagdust-2.33.tar.gz
RUN tar xf tagdust-2.33.tar.gz
WORKDIR /src/tagdust-2.33
RUN ./configure && make && make check && sudo make install
RUN make clean
