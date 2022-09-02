// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreStorage",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "CoreStorage",
            targets: ["CoreStorage"]
        )
    ],
    dependencies: [
        .package(path: "../CoreApp"),
        .package(path: "../CoreKit"),
        .package(path: "../DataKit"),
        .package(path: "../InjectionKit")
    ],
    targets: [
        .target(
            name: "CoreStorage",
            dependencies: [
                "CoreApp",
                "CoreKit",
                "DataKit",
                "InjectionKit"
            ]
        )
    ]
)
