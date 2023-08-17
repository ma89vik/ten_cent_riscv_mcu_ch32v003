#!/bin/bash
docker run -u 1000 --rm -it -v $PWD:/builder/mnt ghcr.io/ma89vik/ten_cent_riscv_mcu_ch32v003:master /bin/bash
