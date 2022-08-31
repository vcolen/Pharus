//
//  AvatarSelectionScene.swift
//
//
//  Created by Victor Colen on 29/08/22.
//

import CoreScene
import AvatarSelectionFeature
import UIKit
import CoreApp

public struct AvatarSelectionScene: AvatarSelectionSceneProtocol {
    public func callAsFunction(
        rootViewController: UITabBarController,
        student: Student
    ) {
        AvatarSelectionTabCoordinator(
            rootViewController: rootViewController
        ).start()
    }

    public init() {

    }
}
