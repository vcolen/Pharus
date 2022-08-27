// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StudentProfileFeature",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "StudentProfileFeature",
            targets: ["StudentProfileFeature"]
        )
    ],
    dependencies: [
        .package(path: "../AlertFeature"),
        .package(path: "../../PharusUI"),
        .package(path: "../../CoreApp")
    ],
    targets: [
        .target(
            name: "StudentProfileFeature",
            dependencies: [
                "AlertFeature",
                "PharusUI",
                "CoreApp"
            ]
        )
    ]
)
