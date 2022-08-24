// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LoginFeature",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "LoginFeature",
            targets: ["LoginFeature"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "LoginFeature",
            dependencies: []
        )
    ]
)
