//
//  HomeScene.swift
//
//
//  Created by Victor Colen on 27/08/22.
//

import CoreScene
import HomeFeature
import UIKit
import CoreApp

public struct HomeScene: HomeSceneProtocol {
    public func callAsFunction(
        rootViewController: UITabBarController,
        student: StudentModel
    ) {
        StudentHomeTabCoordinator(
            rootViewController: rootViewController,
            student: student
        ).start()
    }

    public init() {

    }
}
