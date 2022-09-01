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
        assembleCommon(container)
        assembleLogin(container)
        assembleProfile(container)
        assembleProjects(container)
    }
}

// MARK: - Common
extension CoreKitAssembly {
    func assembleCommon(_ container: Container) {
        container.register(GetStorageDataUseCaseProtocol.self) {
            GetStorageDataUseCase()
        }

        container.register(SetStorageDataUseCaseProtocol.self) {
            SetStorageDataUseCase()
        }
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

        container.register(UpdateStudentUseCaseProtocol.self) {
            UpdateStudentUseCase()
        }
    }
}

// MARK: - Projects
extension CoreKitAssembly {
    func assembleProjects(_ container: Container) {
        container.register(SubscribeToProjectUseCaseProtocol.self) {
            SubscribeToProjectUseCase()
        }
    }
}
