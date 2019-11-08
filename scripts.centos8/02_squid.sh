#!/bin/bash

# install RPMs as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# install stock squid with ecap libs
dnf -y install squid libecap libecap-devel

# make squid autostart after reboot
systemctl enable squid
systemctl restart squid
