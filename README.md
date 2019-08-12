# spawn

[![Swift 5.0](https://img.shields.io/badge/swift-5.0-orange.svg)](#)
[![Swift Package Manager](https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager)
[![@vinhnx](https://img.shields.io/badge/contact-%40vinhnx-blue.svg)](https://twitter.com/vinhnx)

**spawn** A small command-line tool to quickly tryout a Swift Package Manager (SPM) package locally. 

As of Xcode 11, this has been sherlock'ed by Xcode 11 Package support :), as in from Xcode 11 onwards, Xcode will automatically resolve package dependencies and open Xcode project for you, no 3rd party tool needed. But I will keep this tool as learning purpose.

Its job is to check if current repo has any `Package.swift` and resolve dependencies and then open the Xcode for you.

(works with [Vapor](https://github.com/vapor), [too](https://github.com/vinhnx/spawn/blob/master/README.md#vapor))

```bash
$ spawn
Completed resolution in 0.22s
📦 ... Everything is already up-to-date
🛠 ... generated: ./spawn.xcodeproj
📂 ... opening updated Xcode project
✅ all done!
```

NOTE: you might want to close Xcode to have the `xed .` taking into effect, or chose `Revert` option from Xcode alert.

## Goals

When you want to try out or to edit a SPM package in Xcode, or after adding any new `.package` under SPM's package manifest file; you need to either run `swift package update` or `swift package generate-xcodeproj` and reload Xcode again.

This small wrapper aims to automate that process. 

tldr; before:
```bash
$ git clone https://github.com/vinhnx/DictionaryNestedSubscript # clone any Swift Package Manager project
$ cd DictionaryNestedSubscript # change directory to newly cloned repo
$ swift package update # update or resolve package dependencies
$ swift package generate-xcodeproj # generate a .xcodeproj to edit on Xcode
$ xed . # open generated .xcodeproj automatically
```

after:
```bash
$ git clone https://github.com/vinhnx/DictionaryNestedSubscript # clone any Swift Package Manager project
$ cd DictionaryNestedSubscript # change directory to newly cloned repo
$ spawn
```

TODO: I will be looking at the way to automate cloning from remote repo in the future, for example: 

```bash
$ spawn https://github.com/vinhnx/DictionaryNestedSubscript # not yet working
```

## Usage

On any Swift package directory, after `git clone`:

```bash
$ spawn
```

### Vapor

You can use spawn as replacement for Vapor's `vapor xcode -y` command

before:
```bash
$ vapor xcode -y
```

after:
```bash
$ spawn
```

## Installation

🆕 **[swiftbrew](https://github.com/swiftbrew/Swiftbrew)**

"A package manager that installs prebuilt Swift command line tool packages, or Homebrew for Swift packages."

```
$ swift brew install vinhnx/spawn
```

**[homebrew](https://brew.sh)**

```bash
$ brew tap vinhnx/homebrew-formulae
$ brew install spawn
```

or
```bash
$ brew install vinhnx/homebrew-formulae/spawn
```

**[Mint](https://github.com/yonaskolb/mint)**

```bash
$ mint install vinhnx/spawn
```

**[Marathon](https://github.com/JohnSundell/Marathon)**

```bash
$ marathon install vinhnx/spawn
```

**Make**

```bash
$ git clone https://github.com/vinhnx/spawn.git
$ cd spawn
$ make
```

**Swift Package Manager**

```bash
$ git clone https://github.com/vinhnx/spawn.git
$ cd spawn
$ swift build -c release
$ cp -f .build/release/spawn /usr/local/bin/spawn
 ```

## Related projects

If you like this tool, checkout my [vintage](https://github.com/vinhnx/vintage), it's a tool to check for any outdated packages.

Combo:

```bash
$ vintage && spawn # vintage: check for any outdated packages, spawn: generate and update packages for you
```

I hope you like it! :)

## Help, feedback or suggestions?

Feel free to contact me on [Twitter](https://twitter.com/vinhnx) for discussions, news & announcements & other projects. :rocket:
