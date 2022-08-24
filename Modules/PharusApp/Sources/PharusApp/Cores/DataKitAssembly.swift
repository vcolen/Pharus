//
//  DataKitAssembly.swift
//  
//
//  Created by Victor Colen on 24/08/22.
//

import Foundation
import InjectionKit
import DataKit
import CoreKit

struct DataKitAssembly: Assembly {
    func assemble(container: Container) {
        assembleLogin(container: Container)
    }
}

extension DataKitAssembly {
    func assembleLogin(container: Container) {
        container.register(LoginUserRepositoryProtocol.self) {
            LoginUserRepository()
        }
    }
}
