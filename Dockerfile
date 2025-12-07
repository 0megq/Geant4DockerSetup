FROM ubuntu:22.04


ENV GEANT4_VERSION=11.3.2
ENV GEANT4_INSTALL_DIR=/opt/geant4
ENV GEANT4_SOURCE_DIR=geant4-source
ENV GEANT4_BUILD_DIR=geant4-build

# Installing dependencies
RUN apt-get update -y && apt-get install -y \
	wget \
	cmake cmake-curses-gui \
	g++ gcc binutils \
	libx11-dev libxpm-dev  \
	libxft-dev libxext-dev libglew-dev libjpeg-dev libpng-dev libtiff-dev \
	libgif-dev libxml2-dev libssl-dev libfftw3-dev libqt5core5a qtbase5-dev \
	libxmu-dev

# Downloading source code
RUN mkdir -p /opt/${GEANT4_SOURCE_DIR}
WORKDIR /opt
RUN wget https://gitlab.cern.ch/geant4/geant4/-/archive/v11.3.2/geant4-v11.3.2.tar.gz && \
	tar xzfv geant4-v11.3.2.tar.gz -C ${GEANT4_SOURCE_DIR} --strip-components=1

# Configuration and compilation
RUN mkdir -p /opt/${GEANT4_BUILD_DIR}
WORKDIR /opt/${GEANT4_BUILD_DIR}
RUN cmake ../geant4-source \
	-DCMAKE_INSTALL_PREFIX=${GEANT4_INSTALL_DIR} \
	-DCMAKE_BUILD_TYPE=Release \
	-DGEANT4_INSTALL_DATA=ON \
	-DGEANT4_USE_GDML=OFF \
	-DGEANT4_USE_OPENGL_X11=ON \
	-DGEANT4_USE_RAYTRACER_X11=ON \
	-DGEANT4_USE_QT=ON \
	-DGEANT4_BUILD_MULTITHREADED=ON \
	-DGEANT4_USE_SYSTEM_EXPAT=ON \
	-DGEANT4_USE_SYSTEM_ZLIB=OFF

RUN make -j$(nproc) && make install

# Source geant4 shell file on container start
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["tail", "-f", "/dev/null"]
