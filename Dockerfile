FROM ubuntu:jammy as build_env 

ARG QEMU_TAG=v8.1.4

WORKDIR /work

RUN apt update && apt install -y git libglib2.0-dev libfdt-dev \
    libpixman-1-dev zlib1g-dev ninja-build \
    libaio-dev libbluetooth-dev libcapstone-dev libbrlapi-dev libbz2-dev \
    libcap-ng-dev libcurl4-gnutls-dev libgtk-3-dev \
    libibverbs-dev libjpeg8-dev libncurses5-dev libnuma-dev \
    librbd-dev librdmacm-dev \
    libsasl2-dev libsdl2-dev libseccomp-dev libsnappy-dev libssh-dev \
    libvde-dev libvdeplug-dev libvte-2.91-dev libxen-dev liblzo2-dev \
    valgrind xfslibs-dev libnfs-dev libiscsi-dev python3-venv build-essential \
    flex bison

RUN git clone --depth 1 --branch ${QEMU_TAG} https://github.com/qemu/qemu

RUN mkdir /work/qemu/build && cd /work/qemu/build &&\
    ../configure --prefix="/opt/qemu" && make -j

RUN cd /work/qemu/build && make install

RUN cd /work/qemu && git rev-parse HEAD > /opt/qemu/build_hash

FROM ubuntu:jammy as run_env

WORKDIR /work
# We don't want to install a make here
COPY --from=build_env /opt/qemu /opt/qemu
ENV PATH="${PATH}:/opt/qemu/bin"

CMD ["/bin/bash"]