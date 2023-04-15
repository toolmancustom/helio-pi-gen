#!/bin/bash -e

install -m 644 files/zerotier.list "${ROOTFS_DIR}/etc/apt/sources.list.d/"

cat files/zerotier.gpg.key | gpg --dearmor > "${STAGE_WORK_DIR}/zerotier-debian-package-key.gpg"
install -m 644 "${STAGE_WORK_DIR}/zerotier-debian-package-key.gpg" "${ROOTFS_DIR}/etc/apt/trusted.gpg.d/"

on_chroot << EOF
  apt-get update
  # apt-get install -y zerotier-one
EOF