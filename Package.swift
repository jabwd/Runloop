// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Runloop",
    products: [
        .library(
            name: "Runloop",
            targets: ["Runloop"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Runloop",
            dependencies: ["CEvent"]),
		.systemLibrary(name: "CEvent", pkgConfig: "libevent"),
        .testTarget(
            name: "RunloopTests",
            dependencies: ["Runloop"]),
    ]
)
