# ffxiv-on-mac 

1. [About](#about)
1. [Installing](#installing)
1. [What works](#what-works)
1. [What doesn't work](#what-doesnt-work)
1. [Troubleshooting](#troubleshooting)

## About

ffxiv-on-mac is a set of files and scripts for running [Final Fantasy XIV](http://www.finalfantasyxiv.com/) on Mac without the limitations of the native Mac launcher and all the customization available on a native Microsoft Windows install via CrossOver.

## Installing

[Seathasky](https://github.com/seathasky) has done a wonderfull write-up on how to install it's probably best to just follow it [here](https://github.com/seathasky/FF14-MAC_ModSupport)

## What works

* ACT network parsing
* gshade
* xivlauncher with plugin injection
* FFLogs Uploader
* having a Mac only license and using xivlauncher, though your install might break on xivlauncher updates until this [pull request](https://github.com/goatcorp/FFXIVQuickLauncher/pull/572) gets merged (just rerun [XIVLauncherWine.exe](https://github.com/marzent/ffxiv-on-mac/raw/main/XIVLauncherWine.exe) inside your bottle to fix)

## What doesn't work

* a minority of gshade shaders *will* tank your performance
* a few xivlauncher plugins have issues running (compatibility is identical to running under Linux though)
* the cef version OverlayPlugin comes bundeled with (use [Bunny HUD](https://github.com/marzent/Bunny-HUD) or NextUI to fix)

## Troubleshooting

Feel free to hit me up on Discord (ウサギ#4334) if you are having issues with anything in [What works](#what-works)
