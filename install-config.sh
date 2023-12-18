#!/bin/sh

read -p "root password: " root_password
echo $root_password > .ROOT_PASSWORD
read -p "vpn host: " vpn_host
echo $vpn_host
read -p "vpn username: " vpn_username
echo $vpn_username
read -p "vpn password: " vpn_password
echo $vpn_password
echo "host = $vpn_host
port = 443
username = $vpn_username
password = $vpn_password
trusted-cert = 288936cbafb40dac1ccba0fc10f03617c6dbd9fcbcabf18f52a90105bce879c1" > .cli_config