//
//  LoginScene.swift
//
//
//  Created by Victor Colen on 26/08/22.
//

import CoreScene
import LoginFeature
import UIKit

public struct LoginScene: LoginSceneProtocol {
    public func callAsFunction(
        rootViewController: UINavigationController,
        onLogin: @escaping () -> Void
    ) {
        LoginCoordinator(
            rootViewController: rootViewController,
            onLogin: onLogin
        ).start()
    }

    public init() {

    }
}
