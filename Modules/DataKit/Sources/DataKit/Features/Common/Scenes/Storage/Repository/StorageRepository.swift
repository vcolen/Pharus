//
//  File.swift
//
//
//  Created by Victor Colen on 01/09/22.
//

import Foundation
import InjectionKit
import CoreKit

public struct StorageRepository {
    @Injected var localDataSource: StorageDataSource

    public init() { }
}

// MARK: - Local Data Source
extension StorageRepository: StorageRepositoryProtocol {
    public func getStorageData<T: Codable>(_ type: T.Type, key: String) -> T? {
        localDataSource.getCustomStorageData(type, forKey: key)
    }

    public func setStorageData<T: Codable>(_ data: T, forKey key: String) {
        localDataSource.setStorageData(data, forKey: key)
    }
}
