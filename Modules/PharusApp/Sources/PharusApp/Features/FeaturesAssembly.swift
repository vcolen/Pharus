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

struct FeaturesAssembly: Assembly {
   func assemble(container: Container) {
       assembleLogin(container)
       assembleHome(container)
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
}
