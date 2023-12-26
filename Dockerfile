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
    flex bison libmount-dev libunistring-dev libp11-kit-dev

RUN git clone --depth 1 --branch ${QEMU_TAG} https://github.com/qemu/qemu

RUN mkdir /work/qemu/build_system && cd /work/qemu/build_system &&\
    ../configure --enable-system --disable-user --prefix="/opt/qemu_system" &&\
    make -j && make install

RUN mkdir /work/qemu/build_user && cd /work/qemu/build_user &&\
    ../configure --enable-user --disable-system --prefix="/opt/qemu_user" &&\
    make -j && make install

RUN mkdir /work/qemu/build_user_static && cd /work/qemu/build_user_static &&\
    ../configure --enable-user --disable-system --prefix="/opt/qemu_user_static" --static &&\
    make -j && make install && find /opt/qemu_user_static/bin/ -name "qemu-*" -exec mv '{}' '{}-static' ';'

RUN cd /work/qemu && git rev-parse HEAD > /opt/qemu_system/build_hash

# Unfortunately, qemu-system doesn't support static builds and easily breaks, so we can't ship everything in anohter container.
# Ref: https://gitlab.com/qemu-project/qemu/-/issues/1785

# Clean
RUN rm -rf /work/qemu
RUN apt purge -y valgrind flex bison git ninja-build && apt autoremove -y
ENV PATH="${PATH}:/opt/qemu_user_static/bin:/opt/qemu_user/bin:/opt/qemu_system/bin"
CMD ["/bin/bash"]