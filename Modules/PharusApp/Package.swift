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
        .package(path: "../InjectionKit"),

        .package(path: "../Features/AlertFeature"),
        .package(path: "../Features/LoginFeature"),
        .package(path: "../Features/HomeFeature"),
        .package(path: "../Features/AvatarSelectionFeature"),
        .package(path: "../Features/StudentProjectsFeature"),
        .package(path: "../Features/StudentProfileFeature"),
        .package(path: "../Features/StudentProjectsRankingFeature"),
        .package(path: "../Features/SendFileFeature"),

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
                "InjectionKit",
                "CoreScene",
                "LoginFeature",
                "HomeFeature",
                "AppFeature",
                "AvatarSelectionFeature",
                "StudentProjectsFeature",
                "StudentProjectsRankingFeature",
                "SendFileFeature",
                "AlertFeature",
                "StudentProfileFeature"
            ]
        )
    ]
)
