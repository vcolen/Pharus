//
//  LoginSceneProtocol.swift
//
//
//  Created by Victor Colen on 26/08/22.
//

import UIKit
import CoreApp

public protocol LoginSceneProtocol {
    func callAsFunction(
        rootViewController: UINavigationController,
        onLogin: @escaping () -> Void
    )
}
