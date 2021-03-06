#!/bin/bash

CONTAINERS_DIR=/var/lib/lxc/
TEMPLATE_ROOTFS_DIR=/var/cache/lxc/saucy/rootfs-amd64

NAME=$1

CONTAINER_DIR=$CONTAINERS_DIR/$NAME

# mkdir 
RW_DIR=$CONTAINER_DIR/rw
ROOTFS_DIR=$CONTAINER_DIR/rootfs

# mount as aufs
mount -t aufs -o br=$RW_DIR:$TEMPLATE_ROOTFS_DIR none $ROOTFS_DIR

# invoke lxc-create 
lxc-start -d -n $1

