// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StudentProjectsFeature",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "StudentProjectsFeature",
            targets: ["StudentProjectsFeature"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "StudentProjectsFeature",
            dependencies: []
        )
    ]
)
