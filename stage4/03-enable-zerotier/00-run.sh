#!/bin/bash -e

ln -sv "/lib/systemd/system/zerotier-join.service" "$ROOTFS_DIR/etc/systemd/system/multi-user.target.wants/zerotier-join.service"
ln -sv "/lib/systemd/system/zerotier-one.service" "$ROOTFS_DIR/etc/systemd/system/multi-user.target.wants/zerotier-one.service"

# on_chroot << EOF
#   systemctl enable zerotier-one
#   systemctl enable zerotier-join
# EOF