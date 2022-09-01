//
//  StorageRepositoryProtocol.swift
//
//
//  Created by Victor Colen on 01/09/22.
//

import Foundation

public protocol StorageRepositoryProtocol {
    func getStorageData<T: Codable>(_ type: T.Type, key: String) -> T?
    func setStorageData<T: Codable>(_ data: T, forKey key: String)
}
