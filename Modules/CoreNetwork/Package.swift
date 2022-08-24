// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreNetwork",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "CoreNetwork",
            targets: ["CoreNetwork"]
        )
    ],
    dependencies: [
        .package(path: "../DataKit"),
        .package(path: "../CoreKit"),
        .package(path: "../CoreApp"),
        .package(path: "../InjectionKit")
    ],
    targets: [
        .target(
            name: "CoreNetwork",
            dependencies: [
                "DataKit",
                "CoreKit",
                "CoreApp",
                "InjectionKit"
            ]
        )
    ]
)
