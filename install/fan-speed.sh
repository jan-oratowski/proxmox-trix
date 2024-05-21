#!/bin/bash
apt update
apt install fancontrol lm-sensors
sensors -v
sensors-detect
sensors
pwmconfig
nano -w /etc/fancontrol
systemctl start fancontrol