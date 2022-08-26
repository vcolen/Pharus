// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreScene",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "CoreScene",
            targets: ["CoreScene"]
        )
    ],
    dependencies: [
        .package(path: "../CoreKit"),
        .package(path: "../InjectionKit"),
        .package(path: "../CoreApp")
    ],
    targets: [
        .target(
            name: "CoreScene",
            dependencies: [
                "CoreKit",
                "InjectionKit",
                "CoreApp"
            ]
        )
    ]
)