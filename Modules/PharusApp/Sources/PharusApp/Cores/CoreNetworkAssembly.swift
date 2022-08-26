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
    }
}

extension CoreNetworkAssembly {
    func assembleLogin(_ container: Container) {
        container.register(DataKit.LoginRemoteDataSource.self) {
            CoreNetwork.LoginRemoteDataSource()
        }
    }
}
