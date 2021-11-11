#!/bin/bash

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
printf "\nPlease select an option:\n 1) Upgrade to MoltenVK 1.1.5 (large performance gains, DO NOT use with M1 atm)\n 2) Upgrade to MoltenVK 1.1.4 (performance gains, preferred for M1)\n 3) Create a backup of Crossovers MoltenVK, but do nothing otherwise\n 4) Downgrade to MoltenVK 1.10 (this greatly reduces stuttering on 2017 iMacs with an RX 580 Pro, not advised to be used otherwise)\n"
while true; do
    read -p "> " -n 1 -r input
    case $input in
        [1]* )  cp -n "$cxwinedir/../libMoltenVK.dylib" "$cxwinedir/../libMoltenVK.dylib.bak"
                curl -LO https://github.com/Gcenx/MoltenVK/releases/download/v1.1.5/macos_dxvk_patched.tar.xz
                tar xJf macos_dxvk_patched.tar.xz
                cp "Package/Release/MoltenVK/dylib/macOS/libMoltenVK.dylib" "$cxwinedir/../libMoltenVK.dylib"
                rm -r Package
                rm macos_dxvk_patched.tar.xz
                break;;
        [2]* )  cp -n "$cxwinedir/../libMoltenVK.dylib" "$cxwinedir/../libMoltenVK.dylib.bak"
                curl -LO https://github.com/Gcenx/MoltenVK/releases/download/v1.1.4/macos_dxvk_patched.tar.xz
                tar xJf macos_dxvk_patched.tar.xz
                cp "Package/Release/MoltenVK/dylib/macOS/libMoltenVK.dylib" "$cxwinedir/../libMoltenVK.dylib"
                rm -r Package
                rm macos_dxvk_patched.tar.xz
                break;;
        [3]* )  cp -n "$cxwinedir/../libMoltenVK.dylib" "$cxwinedir/../libMoltenVK.dylib.bak"; break;;
        [4]* )  cp -n "$cxwinedir/../libMoltenVK.dylib" "$cxwinedir/../libMoltenVK.dylib.bak"
                curl -L https://media.codeweavers.com/pub/crossover/cxmac/demo/crossover-20.0.4.zip -o crossover-20.0.4.zip
                unzip -qquo crossover-20.0.4.zip
                cp "CrossOver.app/Contents/SharedSupport/CrossOver/lib64/libMoltenVK.dylib" "$cxwinedir/../libMoltenVK.dylib"
                rm -r CrossOver.app
                rm crossover-20.0.4.zip
                break;;
        * ) printf "Invalid option.\n";;
    esac
done
printf "\nLaunching CrossTie, you can now follow the rest of the guide!\n"
open "Final Fantasy XIV Online.tie"
