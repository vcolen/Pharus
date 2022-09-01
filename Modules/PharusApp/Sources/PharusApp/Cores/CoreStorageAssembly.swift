//
//  CoreStorageAssembly.swift
//
//
//  Created by Victor Colen on 24/08/22.
//

import Foundation
import InjectionKit
import CoreStorage
import DataKit
import LoginFeature

 struct CoreStorageAssembly: Assembly {
    func assemble(container: Container) {
        assembleLogin(container: container)
        assembleStorage(container: container)
    }
 }
// MARK: - Common
extension CoreStorageAssembly {
    func assembleStorage(container: Container) {
        container.register(UserDefaultsStoring.self) {
            UserDefaultsStorage()
        }

        container.register(DataKit.StorageDataSource.self) {
            CoreStorage.StorageDataSource()
        }
    }
}

// MARK: - Login
 extension CoreStorageAssembly {
    func assembleLogin(container: Container) {
        container.register(DataKit.LoginLocalDataSource.self) {
            CoreStorage.LoginLocalDataSource()
        }
    }
 }
