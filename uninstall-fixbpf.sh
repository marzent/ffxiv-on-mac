#!/bin/bash

echo 'Uninstalling fixbpf'
bpfdpath='/Library/LaunchDaemons/org.dezent.chmodbpf.plist'
launchctl unload $bpfdpath
sudo rm -f /usr/local/bin/fixbpf
sudo rm -f $bpfdpath

echo 'Uninstall finished!'
