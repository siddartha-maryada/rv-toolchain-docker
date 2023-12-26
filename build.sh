#!/bin/sh

docker build --build-arg UID=$(id -u) -t siddartham/rv-toolchain .
./generate-bin-dir.sh
