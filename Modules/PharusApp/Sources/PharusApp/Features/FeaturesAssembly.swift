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
       assembleAvatarSelection(container)
       assembleProfile(container)
   }
}

// MARK: - Login
extension FeaturesAssembly {

    func assembleLogin(_ container: Container) {
        container.register(LoginUserUseCaseProtocol.self) {
            LoginUserUseCase()
        }
    }
}

// MARK: - Home
extension FeaturesAssembly {

    func assembleHome(_ container: Container) {
        container.register(HomeSceneProtocol.self) {
            HomeScene()
        }
    }
}

// MARK: - Projects
extension FeaturesAssembly {

    func assembleProjects(_ container: Container) {
        container.register(StudentProjectsSceneProtocol.self) {
            ProjectsScene()
        }
    }
}

// MARK: - Ranking
extension FeaturesAssembly {
    func assembleRanking(_ container: Container) {
        container.register(StudentProjectsRankingSceneProtocol.self) {
            RankingScene()
        }
    }
}

// MARK: - Profile
extension FeaturesAssembly {
    func assembleProfile(_ container: Container) {
        container.register(StudentProfileSceneProtocol.self) {
            ProfileScene()
        }
    }
}

// MARK: - Avatar Selection
extension FeaturesAssembly {

    func assembleAvatarSelection(_ container: Container) {
        container.register(AvatarSelectionSceneProtocol.self) {
            AvatarSelectionScene()
        }
    }
}
