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

public struct GetStorageDataUseCase {
    @Injected var repository: StorageRepositoryProtocol

    public init() { }
}

extension GetStorageDataUseCase: GetStorageDataUseCaseProtocol {
    public func callAsFunction<T: Codable>(_ type: T.Type, key: String) -> T? {
        repository.getStorageData(type, key: key)
    }
}
