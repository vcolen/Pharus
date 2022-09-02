// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataKit",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "DataKit",
            targets: ["DataKit"]
        )
    ],
    dependencies: [
        .package(path: "../CoreApp"),
        .package(path: "../CoreKit"),
        .package(path: "../InjectionKit")
    ],
    targets: [
        .target(
            name: "DataKit",
            dependencies: [
                "CoreApp",
                "CoreKit",
                "InjectionKit"
            ]
        )
    ]
)
