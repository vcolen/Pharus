// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SendFileFeature",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "SendFileFeature",
            targets: ["SendFileFeature"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SendFileFeature",
            dependencies: []
        )
    ]
)