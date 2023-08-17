FROM ubuntu:22.04
RUN apt-get update && apt-get install -y --fix-missing --no-install-recommends \
                        build-essential \
                        libnewlib-dev \
                        gcc-riscv64-unknown-elf \
                        libusb-1.0-0-dev \
                        libudev-dev \
                        meson \
                        ninja-build \
                        python3-pip

VOLUME ["/builder/mnt"]
WORKDIR /builder/mnt
