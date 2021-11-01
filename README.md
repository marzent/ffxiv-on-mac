# ffxiv-on-mac 

1. [About](#about)
1. [Installing](#installing)
1. [What works](#what-works)
1. [What doesn't work](#what-doesnt-work)
1. [Troubleshooting](#troubleshooting)

## About

ffxiv-on-mac is a set of files and scripts for running [Final Fantasy XIV](http://www.finalfantasyxiv.com/) on Mac without the limitations of the native Mac launcher and all the customization available on a native Microsoft Windows install via CrossOver.

## Installing

1. Make sure to install [ChmodBPF](https://github.com/marzent/ffxiv-on-mac/raw/main/ChmodBPF/Install%20ChmodBPF.pkg) if you want to use ACTs network parsing (you can skip this step if you have Wireshark already installed)
1. [Download](https://github.com/marzent/ffxiv-on-mac/archive/refs/heads/main.zip) or clone this repo and run `install.sh`
1. Install ffxiv via [CrossTie](https://github.com/marzent/ffxiv-on-mac/raw/main/Final%20Fantasy%20XIV%20Online.tie) or if you want to do it manually follow the instructions [here](https://www.reddit.com/r/macgaming/comments/pr48pk/ff14_mac_client_vs_crossover_21s_huge_increaase/)
1. (optional) install GShade via the [Linux script](https://github.com/HereInPlainSight/gshade_installer/archive/refs/heads/master.zip)
1. (optional) install [ACT](https://advancedcombattracker.com/download.php) and enable WinPCap parsing

## What works

* ACT network parsing
* gshade
* xivlauncher with plugin injection
* FFLogs Uploader

## What doesn't work

* if you have a Mac only license and want to use xivlauncher, you need to do some custom patching (just dm me)
* a minority of gshade shaders *will* tank your performance
* a few xivlauncher plugins have issues running (compatibility is identical to running under Linux though)
* the cef version OverlayPlugin comes bundeled with (use [Bunny HUD](https://github.com/marzent/Bunny-HUD) or NextUI to fix)

## Troubleshooting

Feel free to hit me up on Discord (ウサギ#4334) if you are having issues with anything in [What works](#what-works)
