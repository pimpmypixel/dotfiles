#!/bin/bash
# Save VPN credentials encrypted with gpg
# Usage: ./save-vpn-creds.sh
# You'll be prompted for your VPN item fields first, then a gpg password

set -e

GPG_FILE="$HOME/.dtu-vpn.gpg"

echo -n "Username: "
read USER

echo -n "Password: "
read -s PASS
echo

echo -n "TOTP secret (if applicable): "
read -s TOTP
echo

printf "%s\n%s\n%s\n" "$USER" "$PASS" "$TOTP" | gpg -c -o "$GPG_FILE"

chmod 600 "$GPG_FILE"
echo "Saved to $GPG_FILE"
