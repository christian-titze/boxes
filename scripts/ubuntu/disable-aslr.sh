#!/bin/bash

echo 0 > /proc/sys/kernel/randomize_va_space
echo "kernel.randomize_va_space = 0" > /etc/sysctl.d/01-disable-aslr.conf
