// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "spawn",
    products: [
        .executable(name: "spawn", targets: ["spawn"])
    ],
    dependencies: [
        .package(url: "https://github.com/JohnSundell/ShellOut.git", from: "2.0.0"),
        .package(url: "git@github.com:JohnSundell/Files.git", from: "3.0.0")
    ],
    targets: [
        .target(
            name: "spawn",
            dependencies: ["ShellOut", "Files"]),
        .testTarget(
            name: "spawnTests",
            dependencies: ["spawn"]),
    ]
)
