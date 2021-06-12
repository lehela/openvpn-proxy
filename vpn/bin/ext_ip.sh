#!/bin/bash
# set -x
RSP=$(wget -nv -O - https://ipinfo.io/)
echo $RSP
