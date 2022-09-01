//
//  GetStorageDataUseCaseProtocol.swift
//
//
//  Created by Victor Colen on 01/09/22.
//

import Foundation
import InjectionKit

public protocol GetStorageDataUseCaseProtocol {
    func callAsFunction<T: Codable>(_ type: T.Type, key: String) -> T?
}

public struct GetStorageDataUseCase: GetStorageDataUseCaseProtocol {
    @Injected var repository: StorageRepositoryProtocol

    public init() { }

    public func callAsFunction<T: Codable>(_ type: T.Type, key: String) -> T? {
        repository.getStorageData(type, key: key)
    }
}
