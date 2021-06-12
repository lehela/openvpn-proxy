#!/bin/bash
# set -x
RSP=$( \
    wget \
        -e use_proxy=yes \
        -e https_proxy=cyberghost:3128 \
        -e http_proxy=cyberghost:3128 \
        -nv \
        -O - \
        https://ipinfo.io \
    )
echo $RSP
