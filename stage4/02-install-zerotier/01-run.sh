#!/bin/bash -e

install -m 644 files/zerotier.list "${ROOTFS_DIR}/etc/apt/sources.list.d/"
install -m 644 files/zerotier-join.service "${ROOTFS_DIR}/lib/systemd/system/"
echo "ZEROTIER_NETWORK_ID=${ZEROTIER_NETWORK_ID}" > "${ROOTFS_DIR}/boot/zerotier.conf"

cat files/zerotier.gpg.key | gpg --dearmor > "${STAGE_WORK_DIR}/zerotier-debian-package-key.gpg"
install -m 644 "${STAGE_WORK_DIR}/zerotier-debian-package-key.gpg" "${ROOTFS_DIR}/etc/apt/trusted.gpg.d/"


on_chroot << EOF
  apt-get update
  # apt-get install -y zerotier-one
EOF