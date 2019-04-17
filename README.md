# spawn

[![Swift 5.0](https://img.shields.io/badge/swift-5.0-orange.svg)](#)
[![Swift Package Manager](https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager)
[![@vinhnx](https://img.shields.io/badge/contact-%40vinhnx-blue.svg)](https://twitter.com/vinhnx)

**spawn** is a small command-line utility wrapper for Swift Package Manager update commands:

before:

```bash
$ swift package update 
$ swift package generate-xcodeproj
$ xed . # this will open the newly generated Xcode project
```

after:

```bash
$ spawn
```

NOTE: you might want to close Xcode to have the `xed .` taking into effect, or chose `Revert` option from Xcode alert.

## Goals

After adding any new `.package` under SPM's package manifest file, in order to use the new package, we need to either run `swift package update` or `swift package generate-xcodeproj` and reload Xcode again.

This small wrapper aims to automate that process.

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

Without any specifications (have to be executed in the directory where [Swift Package Manager manifest file (Package.swift)](https://github.com/apple/swift-package-manager/blob/master/Documentation/Usage.md) is located):

```bash
$ spawn run
```

Specifies path of Swift Package Manager directory to update:

```bash
$ spawn run -p Dependencies
```

Help page:

```bash
$ spawn --help

Usage:

    $ spawn

Commands:

    + run - Check project's Package dependencies' local version with remote latest version.
```

Run with option:

```bash
$ spawn run --help

Usage:

    $ spawn run

Options:
    --path [default: .] - Path to the folder contains Swift Package manifest file (Package.swift).
```

## Help, feedback or suggestions?

Feel free to contact me on [Twitter](https://twitter.com/vinhnx) for discussions, news & announcements about Sugar & other projects. :rocket:
