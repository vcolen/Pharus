// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AlertFeature",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "AlertFeature",
            targets: ["AlertFeature"]
        )
    ],
    dependencies: [
        .package(path: "../../CoreApp"),
        .package(path: "../../PharusUI")
    ],
    targets: [
        .target(
            name: "AlertFeature",
            dependencies: [
                "CoreApp",
                "PharusUI"
            ]
        )
    ]
)
