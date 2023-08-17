#!/bin/bash
docker run -u 1000 --rm -it -v $PWD:/builder/mnt 2cbe136a1fc1 /bin/bash
