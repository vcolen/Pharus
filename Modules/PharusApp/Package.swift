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
        .package(path: "../AppFeature"),

        .package(path: "../CoreApp"),
        .package(path: "../CoreKit"),
        .package(path: "../CoreNetwork"),
        .package(path: "../CoreScene"),
        .package(path: "../CoreStorage"),
        .package(path: "../DataKit"),
        .package(path: "../InjectionKit"),

        .package(path: "../Features/AlertFeature"),
        .package(path: "../Features/AvatarSelectionFeature"),
        .package(path: "../Features/HomeFeature"),
        .package(path: "../Features/LoginFeature"),
        .package(path: "../Features/SendFileFeature"),
        .package(path: "../Features/StudentProfileFeature"),
        .package(path: "../Features/StudentProjectsFeature"),
        .package(path: "../Features/StudentProjectsRankingFeature")
    ],
    targets: [
        .target(
            name: "PharusApp",
            dependencies: [
                "AlertFeature",
                "AppFeature",
                "AvatarSelectionFeature",
                "CoreApp",
                "CoreKit",
                "CoreNetwork",
                "CoreScene",
                "CoreStorage",
                "DataKit",
                "HomeFeature",
                "InjectionKit",
                "LoginFeature",
                "SendFileFeature",
                "StudentProfileFeature",
                "StudentProjectsFeature",
                "StudentProjectsRankingFeature"
            ]
        )
    ]
)
