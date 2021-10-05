#!/usr/bin/env bash

echo 'Setting up launchd to give users in group "admin" access to libpcap'
CHMODBPF = '/Library/LaunchDaemons/org.dezent.chmodbpf.plist'
sudo cp launchd/org.dezent.chmodbpf.plist $CHMODBPF
sudo chmod 644 $CHMODBPF
sudo chown root:wheel $CHMODBPF
launchctl load $CHMODBPF

echo 'Creating alias "fix-bpf" in case permissions break'
echo 'alias fix-bpf="launchctl unload $CHMODBPF; launchctl load $CHMODBPF"' >> ~/.zshrc

echo 'Patching Crossover'
CX_WINE_DIR = '/Applications/CrossOver.app/Contents/SharedSupport/CrossOver/lib64/wine'
cp -b wine-dlls/iphlpapi.dll.so CX_WINE_DIR/iphlpapi.dll.so
cp -b wine-dlls/ntdll.dll CX_WINE_DIR/ntdll.dll
cp -b wine-dlls/wpcap.dll.so CX_WINE_DIR/wpcap.dll.so
cp -b wine-dlls/wpcap.so CX_WINE_DIR/wpcap.so

echo 'You can now follow the rest of the install guide!'
