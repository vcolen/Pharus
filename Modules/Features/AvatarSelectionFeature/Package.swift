// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AvatarSelectionFeature",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "AvatarSelectionFeature",
            targets: ["AvatarSelectionFeature"]
        )
    ],
    dependencies: [
        .package(path: "../../CoreApp"),
        .package(path: "../../PharusUI")

    ],
    targets: [
        .target(
            name: "AvatarSelectionFeature",
            dependencies: [
                "CoreApp",
                "PharusUI"
            ]
        )
    ]
)
