//
//  StudentProfileSceneProtocol.swift
//
//
//  Created by Victor Colen on 26/08/22.
//

import UIKit
import CoreApp

public protocol StudentProfileSceneProtocol {
    func callAsFunction(
        rootViewController: UITabBarController,
        student: Student,
        onLogout: @escaping () -> Void
    )
}
