//
//  ProjectsScene.swift
//
//
//  Created by Victor Colen on 29/08/22.
//

import CoreScene
import StudentProjectsFeature
import UIKit
import CoreApp

public struct ProjectsScene: StudentProjectsSceneProtocol {
    public func callAsFunction(
        rootViewController: UITabBarController,
        student: Student
    ) {
        StudentProjectsTabCoordinator(
            rootViewController: rootViewController,
            student: student
        ).start()
    }

    public init() {

    }
}
