//
//  SetStorageDataUseCaseProtocol.swift
//
//
//  Created by Victor Colen on 01/09/22.
//

import Foundation
import InjectionKit

public protocol SetStorageDataUseCaseProtocol {
    func callAsFunction<T: Codable>(_ data: T, forKey key: String)
}

public struct SetStorageDataUseCase: SetStorageDataUseCaseProtocol {
    @Injected var repository: StorageRepositoryProtocol

    public init() { }

    public func callAsFunction<T: Codable>(_ data: T, forKey key: String) {
        repository.setStorageData(data, forKey: key)
    }
}
