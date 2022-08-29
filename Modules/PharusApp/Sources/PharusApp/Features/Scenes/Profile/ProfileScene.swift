//
//  File.swift
//
//
//  Created by Victor Colen on 29/08/22.
//

import StudentProfileFeature
import UIKit
import CoreApp
import CoreScene

public struct ProfileScene: StudentProfileSceneProtocol {
    public func callAsFunction(
        rootViewController: UITabBarController,
        student: Student,
        onLogout logoutHandler: @escaping () -> Void
    ) {
        StudentProfileTabCoordinator(
            rootViewController: rootViewController,
            student: student,
            onLogout: logoutHandler
        ).start()
    }

    public init() {

    }
}
