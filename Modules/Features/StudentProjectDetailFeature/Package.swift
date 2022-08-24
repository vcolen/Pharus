// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StudentProjectDetailFeature",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "StudentProjectDetailFeature",
            targets: ["StudentProjectDetailFeature"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "StudentProjectDetailFeature",
            dependencies: []
        )
    ]
)
