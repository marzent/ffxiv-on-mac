# ffxiv-on-mac 

1. [About](#about)
1. [Installing](#installing)
1. [What works](#what-works)
1. [What doesn't work](#what-doesnt-work)
1. [Troubleshooting](#troubleshooting)

## About

ffxiv-on-mac is a set of files and scripts for running [Final Fantasy XIV](http://www.finalfantasyxiv.com/) on Mac without the limitations of the native Mac launcher and all the customization available on a native Microsoft Windows install.

## Installing

1. Make sure to install ChmodBPF if you want to use ACTs network parsing (you can skip this step if you have Wireshark already installed)
1. Clone this repo and run `install.sh`
1. Install ffxiv via CrossTie (file will be released soon) or follow the instructions here https://www.reddit.com/r/macgaming/comments/pr48pk/ff14_mac_client_vs_crossover_21s_huge_increaase/
1. (optional) install gshade via the Linux script
1. (optional) install ACT and enable WinPCap parsing

## What works

* ACT network parsing
* gshade
* xivlauncher with plugin injection
* FFLogs Uploader

## What doesn't work

* a minority of gshade shaders *will* tank your performance
* a few xivlauncher plugins have issues running (compatibility is identical to running under Linux though)
* the cef version OverlayPlugin comes bundeled with (use Bunny HUD or NextUI to fix)

## Troubleshooting

Feel free to hit me up on Discord (ウサギ#4334) if you are having issues with anything in [What works](#what-works)
