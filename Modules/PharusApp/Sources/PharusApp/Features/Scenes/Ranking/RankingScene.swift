//
//  RankingScene.swift
//
//
//  Created by Victor Colen on 29/08/22.
//

import CoreScene
import StudentProjectsRankingFeature
import UIKit
import CoreApp

public struct RankingScene: StudentProjectsRankingSceneProtocol {
    public func callAsFunction(
        rootViewController: UITabBarController
    ) {
        StudentProjectsRankingTabCoordinator(
            rootViewController: rootViewController
        ).start()
    }

    public init() {

    }
}
