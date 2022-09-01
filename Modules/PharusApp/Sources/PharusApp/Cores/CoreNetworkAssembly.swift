//
//  File.swift
//
//
//  Created by Victor Colen on 26/08/22.
//

import Foundation
import InjectionKit
import CoreNetwork
import DataKit
import LoginFeature

struct CoreNetworkAssembly: Assembly {
    func assemble(container: Container) {
        assembleLogin(container)
        assembleProfile(container)
    }
}

// MARK: - Login
extension CoreNetworkAssembly {
    func assembleLogin(_ container: Container) {
        container.register(DataKit.LoginRemoteDataSource.self) {
            CoreNetwork.LoginRemoteDataSource()
        }
    }
}

// MARK: - Profile
extension CoreNetworkAssembly {
    func assembleProfile(_ container: Container) {
        container.register(DataKit.ProfileRemoteDataSource.self) {
            CoreNetwork.ProfileRemoteDataSource()
        }
    }
}
