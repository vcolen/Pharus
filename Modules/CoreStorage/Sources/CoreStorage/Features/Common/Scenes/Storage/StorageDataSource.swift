//
//  StorageDataSource.swift
//
//
//  Created by Victor Colen on 01/09/22.
//

import Foundation
import DataKit
import InjectionKit

public struct StorageDataSource {
    @Injected var userDefaults: UserDefaultsStoring

    public init() { }
}

extension StorageDataSource: DataKit.StorageDataSource {
    public func getCustomStorageData<T: Codable>(_ type: T.Type, forKey key: String) -> T? {
        return userDefaults.getCustomObject(T.self, key: key)
    }

    public func setStorageData<T: Codable>(_ data: T, forKey key: String) {
        do {
            userDefaults.set(
                try JSONEncoder().encode(data),
                key: key
            )
        } catch {
            print("Unable to Encode \(T.self): \(error)")
        }
    }
}
