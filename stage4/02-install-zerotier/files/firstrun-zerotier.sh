#!/bin/bash -e

echo
echo '*** Enabling and starting ZeroTier service...'

systemctl enable zerotier-one
systemctl start zerotier-one

echo
echo '*** Waiting for identity generation...'

while [ ! -f /var/lib/zerotier-one/identity.secret ]; do
	sleep 1
done

echo
echo "*** Success! You are ZeroTier address [ `cat /var/lib/zerotier-one/identity.public | cut -d : -f 1` ]."
echo

if [[ $ZEROTIER_NETWORK_ID ]]; then
  zerotier-cli join "${ZEROTIER_NETWORK_ID}"
fi