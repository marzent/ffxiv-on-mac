#!/bin/bash

echo 'Setting up launchd to give users in group "admin" access to libpcap'
bpfdpath='/Library/LaunchDaemons/org.dezent.chmodbpf.plist'
sudo cp launchd/org.dezent.chmodbpf.plist $bpfdpath
sudo chmod 644 $bpfdpath
sudo chown root:wheel $bpfdpath
launchctl load $bpfdpath

echo 'Creating alias "fix-bpf" in case permissions break'
echo "alias fix-bpf='launchctl unload $bpfdpath; launchctl load $bpfdpath'" >> ~/.zshrc

echo 'Patching Crossover'
cxwinedir='/Applications/CrossOver.app/Contents/SharedSupport/CrossOver/lib64/wine'
cp -n "$cxwinedir/iphlpapi.dll.so" "$cxwinedir/iphlpapi.dll.so.bak"
cp -n "$cxwinedir/ntdll.dll" "$cxwinedir/ntdll.dll.bak"
cp -n "$cxwinedir/wpcap.dll.so" "$cxwinedir/wpcap.dll.so.bak"
cp wine-dlls/iphlpapi.dll.so "$cxwinedir/iphlpapi.dll.so"
cp wine-dlls/ntdll.dll "$cxwinedir/ntdll.dll"
cp wine-dlls/wpcap.dll.so "$cxwinedir/wpcap.dll.so"
cp wine-dlls/wpcap.so "$cxwinedir/wpcap.so"

echo 'You can now follow the rest of the install guide!'
