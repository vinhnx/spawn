# spawn

[![Swift 5.0](https://img.shields.io/badge/swift-5.0-orange.svg)](#)
[![Swift Package Manager](https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager)
[![@vinhnx](https://img.shields.io/badge/contact-%40vinhnx-blue.svg)](https://twitter.com/vinhnx)

**spawn** is a small command-line utility wrapper for Swift Package Manager update commands:

before:
```bash
$ git clone https://github.com/vinhnx/spawn # clone any Swift Package Manager project
$ swift package update # update or resolve package dependencies
$ swift package generate-xcodeproj # generate a .xcodeproj to edit on Xcode
$ xed . # open generated .xcodeproj automatically
```

after:
```bash
$ spawn
```

NOTE: you might want to close Xcode to have the `xed .` taking into effect, or chose `Revert` option from Xcode alert.

## Goals

After adding any new `.package` under SPM's package manifest file, in order to use the new package, we need to either run `swift package update` or `swift package generate-xcodeproj` and reload Xcode again.

This small wrapper aims to automate that process. 

Check Usage section below for more details.

## Installation

#### On Mac

Using **Make** (recommended):

```bash
$ git clone https://github.com/vinhnx/spawn.git
$ cd spawn
$ make
```

Using the **Swift Package Manager**:

```bash
$ git clone https://github.com/vinhnx/spawn.git
$ cd spawn
$ swift build -c release -Xswiftc -static-stdlib
$ cp -f .build/release/spawn /usr/local/bin/spawn
 ```
 
Using **[Mint](https://github.com/yonaskolb/mint)**:

```bash
$ mint install vinhnx/spawn
```

Using **[Marathon](https://github.com/JohnSundell/Marathon)**:

```bash
$ marathon install vinhnx/spawn
```

#### On Linux

```bash
$ git clone https://github.com/vinhnx/spawn.git
$ cd spawn
$ swift build -c release
$ cp -f .build/release/spawn /usr/local/bin/spawn
```

If you encounter a permissions failure while installing, you may need to prepend sudo to the commands. To update `spawn`, simply repeat any of the above two series of commands, except cloning the repo.

## Usage

On any Swift package directory, after `git clone`:

```bash
$ spawn
```

## Help, feedback or suggestions?

Feel free to contact me on [Twitter](https://twitter.com/vinhnx) for discussions, news & announcements & other projects. :rocket:
