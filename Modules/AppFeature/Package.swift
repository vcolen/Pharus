// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppFeature",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "AppFeature",
            targets: ["AppFeature"]
        )
    ],
    dependencies: [
        .package(path: "../CoreApp"),
        .package(path: "../CoreKit"),
        .package(path: "../CoreScene"),
        .package(path: "../InjectionKit"),

        .package(path: "../Features/LoginFeature")
    ],
    targets: [
        .target(
            name: "AppFeature",
            dependencies: [
                "CoreApp",
                "CoreKit",
                "CoreScene",
                "InjectionKit",
                "LoginFeature"
            ]
        )
    ]
)
