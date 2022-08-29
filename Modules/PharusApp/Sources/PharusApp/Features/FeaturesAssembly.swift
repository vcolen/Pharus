//
//  FeaturesAssembly.swift
//
//
//  Created by Victor Colen on 26/08/22.
//

import CoreScene
import AppFeature
import InjectionKit
import CoreKit
import StudentProjectsFeature

struct FeaturesAssembly: Assembly {
   func assemble(container: Container) {
       assembleLogin(container)
       assembleHome(container)
       assembleProjects(container)
       assembleRanking(container)
       assembleProfile(container)
       assembleAvatarSelection(container)
   }
}

extension FeaturesAssembly {
    func assembleLogin(_ container: Container) {
        container.register(LoginUserUseCaseProtocol.self) {
            LoginUserUseCase()
        }
    }

    func assembleHome(_ container: Container) {
        container.register(HomeSceneProtocol.self) {
            HomeScene()
        }
    }

    func assembleProjects(_ container: Container) {
        container.register(StudentProjectsSceneProtocol.self) {
            ProjectsScene()
        }
    }

    func assembleRanking(_ container: Container) {
        container.register(StudentProjectsRankingSceneProtocol.self) {
            RankingScene()
        }
    }

    func assembleProfile(_ container: Container) {
        container.register(StudentProfileSceneProtocol.self) {
            ProfileScene()
        }
    }

    func assembleAvatarSelection(_ container: Container) {
        container.register(AvatarSelectionSceneProtocol.self) {
            AvatarSelectionScene()
        }
    }
}
