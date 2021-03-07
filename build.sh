#!/bin/bash

set -e

CBL_PATH=${HOME}/ClangBuiltLinux/bin

export ARCH=arm64
export PATH=${CBL_PATH}:${PATH}

args="-j$(nproc --all) \
O=out \
CROSS_COMPILE=aarch64-linux-gnu- \
CLANG_TRIPLE=aarch64-linux-gnu- \
CC=clang \
LD=ld.lld"
make ${args} haydn-qgki_defconfig
make ${args} 2>&1 | tee build.log
