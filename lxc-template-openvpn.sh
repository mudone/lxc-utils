#!/bin/bash

TEMPLATE_ROOTFS_DIR=/var/cache/lxc/saucy/rootfs-amd64

# set tun device
mkdir -p $TEMPLATE_ROOTFS_DIR/dev/net/
mknod -m 666 $TEMPLATE_ROOTFS_DIR/dev/net/tun c 10 200

# bind dev sys proc etc to rootfs
mount --bind /dev $TEMPLATE_ROOTFS_DIR/dev
mount --bind /sys $TEMPLATE_ROOTFS_DIR/sys
mount --bind /proc $TEMPLATE_ROOTFS_DIR/proc
mount --bind /dev/pts $TEMPLATE_ROOTFS_DIR/dev/pts

# chroot to rootfs and install openvpn
chroot $TEMPLATE_ROOTFS_DIR /bin/bash -c "apt-get update && apt-get install -y openvpn"
