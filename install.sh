#!/bin/bash

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
