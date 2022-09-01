//
//  CoreKitAssemble.swift
//
//
//  Created by Victor Colen on 24/08/22.
//

import Foundation
import InjectionKit
import CoreKit
import LoginFeature

struct CoreKitAssembly: Assembly {
    func assemble(container: Container) {
        assembleLogin(container)
        assembleProfile(container)
    }
}

// MARK: - Login
extension CoreKitAssembly {
    func assembleLogin(_ container: Container) {
        container.register(LoginUserUseCaseProtocol.self) {
            LoginUserUseCase()
        }

        container.register(GetUserTokenUseCaseProtocol.self) {
            GetUserTokenUseCase()
        }
    }
}

// MARK: - Profile
extension CoreKitAssembly {
    func assembleProfile(_ container: Container) {
        container.register(GetStudentUseCaseProtocol.self) {
            GetStudentUseCase()
        }
    }
}
