#!/bin/bash

sudo wget -q -O /usr/bin/checksec http://www.trapkit.de/tools/checksec.sh
sudo chmod 755 /usr/bin/checksec
sudo sed -i -e 's/\r$//' /usr/bin/checksec
