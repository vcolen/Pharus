// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PharusApp",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "PharusApp",
            targets: ["PharusApp"]
        )
    ],
    dependencies: [
        .package(path: "../CoreStorage"),
        .package(path: "../CoreNetwork"),
        .package(path: "../DataKit"),
        .package(path: "../CoreKit"),
        .package(path: "../CoreApp"),
        .package(path: "../CoreScene"),

        .package(path: "../Features/LoginFeature"),
        .package(path: "../Features/HomeFeature"),

        .package(path: ".../AppFeature")
    ],
    targets: [
        .target(
            name: "PharusApp",
            dependencies: [
                "CoreStorage",
                "CoreNetwork",
                "DataKit",
                "CoreKit",
                "CoreApp",
                "CoreScene",
                "LoginFeature",
                "HomeFeature",
                "AppFeature"
            ]
        )
    ]
)
