// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PharusUI",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "PharusUI",
            targets: ["PharusUI"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "PharusUI",
            dependencies: []
        )
    ]
)
