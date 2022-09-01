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
        assembleLogin(container)
        assembleProfile(container)
    }
 }

// MARK: - Login
 extension DataKitAssembly {
    func assembleLogin(_ container: Container) {
        container.register(LoginRepositoryProtocol.self) {
            LoginRepository()
        }
    }
 }

// MARK: - Profile
extension DataKitAssembly {
   func assembleProfile(_ container: Container) {
       container.register(ProfileRepositoryProtocol.self) {
           ProfileRepository()
       }
   }
}
