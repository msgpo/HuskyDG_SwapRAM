# Magisk RAM Swapper
## About
Expand RAM memory by converting a part of storage to Swap RAM

## Requirements
- Magisk 20.4+ is installed

## Installation
It's Magisk module, flash it in **Magisk** app

## Usage
Show help in Terminal Emulator:

```
su -c swapram
```

Add Swap file and enable Swap RAM with 2GB size:

```
su -c swapram add 2
```

Disable Swap RAM:

```
su -c swapram remove
```

Show status:

```
su -c swapram status
```

Change ZRAM size to 2048MB:

```
su -c swapram zram 2048M
```
