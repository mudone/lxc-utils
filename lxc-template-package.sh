#!/bin/bash

TEMPLATE_ROOTFS_DIR=/var/cache/lxc/saucy/rootfs-amd64

package=$1

# bind dev sys proc etc to rootfs
mount --bind /dev $TEMPLATE_ROOTFS_DIR/dev
mount --bind /sys $TEMPLATE_ROOTFS_DIR/sys
mount --bind /proc $TEMPLATE_ROOTFS_DIR/proc
mount --bind /dev/pts $TEMPLATE_ROOTFS_DIR/dev/pts

# chroot to rootfs
chroot $TEMPLATE_ROOTFS_DIR /bin/bash -c  "apt-get update && apt-get install -y $package"
