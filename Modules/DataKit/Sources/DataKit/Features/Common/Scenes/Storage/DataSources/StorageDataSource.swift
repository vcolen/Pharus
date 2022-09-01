//
//  StorageDataSource.swift
//
//
//  Created by Victor Colen on 01/09/22.
//

import Foundation

public protocol StorageDataSource {
    func getCustomStorageData<T: Codable>(_ type: T.Type, forKey key: String) -> T?
    func setStorageData<T: Codable>(_ data: T, forKey key: String)
}
