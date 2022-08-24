// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreApp",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "CoreApp",
            targets: ["CoreApp"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CoreApp",
            dependencies: []
        )
    ]
)
