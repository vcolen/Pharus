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
    dependencies: [
        .package(path: "../../CoreApp"),
        .package(path: "../../CoreKit"),
        .package(path: "../../PharusUI"),
        .package(path: "../../InjectionKit"),
        .package(path: "../../CoreScene")
    ],
    targets: [
        .target(
            name: "LoginFeature",
            dependencies: [
                "CoreApp",
                "CoreKit",
                "PharusUI",
                "InjectionKit",
                "CoreScene"
            ]
        )
    ]
)
