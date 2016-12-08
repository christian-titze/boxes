#!/bin/bash

./python.sh
apt-get install -y libffi-dev libssl-dev
pip2 install --upgrade pwntools
