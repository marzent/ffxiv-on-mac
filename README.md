# ffxiv-on-mac 

1. [About](#about)
1. [Installing](#installing)
1. [What works](#what-works)
1. [What doesn't work](#what-doesnt-work)
1. [Troubleshooting](#troubleshooting)

## About

ffxiv-on-mac is a set of files and scripts for running [Final Fantasy XIV](http://www.finalfantasyxiv.com/) on Mac without the limitations of the native Mac launcher and all the customization available on a native Microsoft Windows install via CrossOver.

There are also some MoltenVK versions patched for dxvk available to get more performace out of CrossOver (25% fps increase on most systems with MoltenVK 1.1.5 vs 1.1.3)

## Installing

Check out our installtion guide [here](https://github.com/seathasky/FF14-MAC_ModSupport)

## What works

* ACT network parsing
* GShade
* XIVLauncher with plugin injection
* FFLogs Uploader
* having a Mac only license and using XIVLauncher, though your install might break on XIVLauncher updates until this [pull request](https://github.com/goatcorp/FFXIVQuickLauncher/pull/572) gets merged (just rerun [XIVLauncherWine.exe](https://github.com/marzent/ffxiv-on-mac/raw/main/XIVLauncherWine.exe) inside your bottle to fix)

## What doesn't work

* a minority of GShade shaders *will* tank your performance
* a few XIVLauncher plugins have issues running (compatibility is identical to running under Linux though)
* the cef version OverlayPlugin comes bundeled with (use [Bunny HUD](https://github.com/marzent/Bunny-HUD) or NextUI to fix)

## Troubleshooting

Feel free to hit me up on Discord (ウサギ#4334) if you are having issues with anything in [What works](#what-works)
