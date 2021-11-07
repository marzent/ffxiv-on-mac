#!/bin/bash
cd -- "$(dirname "$BASH_SOURCE")"

cxLoc="/Applications/CrossOver.app"
if [ ! -d "$cxLoc" ]; then
    printf "CrossOver not installed at $cxLoc. Exiting...\n"
    exit 1
fi
echo "CrossOver found at $cxLoc!"

yesNo() {
  while true; do
    read -p "$*" -n 1 -r yn
    case $yn in
      [Yy]* ) return 0; break;;
      [Nn]* ) return 1; break;;
      * ) printf "\tPlease answer yes or no.\n";;
    esac
  done
}

cxwinedir="$cxLoc/Contents/SharedSupport/CrossOver/lib64/wine"
if ( yesNo "Do you want to parse FFXIV data with ACT by scanning network data?" ); then
    cp -n "$cxwinedir/iphlpapi.dll.so" "$cxwinedir/iphlpapi.dll.so.bak"
    cp -n "$cxwinedir/wpcap.dll.so" "$cxwinedir/wpcap.dll.so.bak"
    cp wine-dlls/iphlpapi.dll.so "$cxwinedir/iphlpapi.dll.so"
    cp wine-dlls/wpcap.dll.so "$cxwinedir/wpcap.dll.so"
    cp wine-dlls/wpcap.so "$cxwinedir/wpcap.so"
    printf "\n"
    if ( yesNo "If you haven't installed WireShark you need to install ChmodBPF for network parsing to work. Do you want to install it now?" ); then
        open "ChmodBPF/Install ChmodBPF.pkg"
    fi
fi
printf "\n"
if ( yesNo "Do you want to inject plugins via XIVLauncher or play with a Windows License?" ); then
    cp -n "$cxwinedir/ntdll.dll" "$cxwinedir/ntdll.dll.bak"
    cp wine-dlls/ntdll.dll "$cxwinedir/ntdll.dll"
fi
printf "\n"
if ( yesNo "Do you want to upgrade CrossOvers MoltenVK version to 1.1.5? This can improve performance by more than 25 percent" ); then
    cp -n "$cxwinedir/../libMoltenVK.dylib" "$cxwinedir/../libMoltenVK.dylib.bak"
    cp MoltenVK/1.1.5-dxvk/libMoltenVK.dylib "$cxwinedir/../libMoltenVK.dylib"
fi
printf "\nLaunching CrossTie, you can now follow the rest of the guide!\n"
open "Final Fantasy XIV Online.tie"
