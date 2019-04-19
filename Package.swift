// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "spawn",
    products: [
        .executable(name: "spawn", targets: ["spawn"])
    ],
    targets: [
        .target(
            name: "spawn",
            dependencies: []),
        .testTarget(
            name: "spawnTests",
            dependencies: ["spawn"]),
    ]
)
