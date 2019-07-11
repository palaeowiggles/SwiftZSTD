# SwiftZSTD
Swift Wrapper around ZSTD Compression Library

<p align="center">
    <img src="https://img.shields.io/badge/Swift-5.0-orange.svg" />
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
    </a>
    <img src="https://img.shields.io/badge/platforms-mac+linux-brightgreen.svg?style=flat" alt="Mac + Linux" />
</p>

## System Requirements

Zstandard is required to be installed in order to build this package. See https://github.com/facebook/zstd for additional information, including licensing.

On OS X the easiest way to install Zstandard is with [homebrew](https://brew.sh)
```sh
brew install zstd
```

On Ubuntu it can be installed with apt
```sh
sudo apt install libzstd-dev
```

## Installation

This has been bundled as a swift package for Swift 5. To use it in a project include the pacakge as a dependency in your projects Package.swift:

```swift
    dependencies: [
        .package(url: "https://github.com/HeartedApp/SwiftZSTD", .branch("master"))
    ],
```

In order to test out the included example ZSTDSampleApp run `swift run` 

```sh
$ swift run
Testing compression

Original size: 1465 bytes
Compressed size: 757 bytes
Decompressed string is the same as original.

Testing compression with dictionary

Building Dictionary
Original size: 1465 bytes
Compressed size: 438 bytes
Dictionary decompressed string is the same as original.
```

## Limitations

Compression and de-compression of in-memory buffers is supported, with or without a context or a dictionary.  Buffers are represented by Data instances that must use contiguous storage, and in practice most Data instances meet this requirement.  To be decompressed by this code, a buffer must be a complete frame with decompressed size encoded in it and retrievable using ZSTD_getDecompressedSize().  

This is actually a fairly useful implementation.  Experimentation shows that even fairly large files (100s of MB),when compressed using the zstd utility provided with the C library, end up in a single frame, which is easily decompressible by this Swift code if read into memory as one piece.