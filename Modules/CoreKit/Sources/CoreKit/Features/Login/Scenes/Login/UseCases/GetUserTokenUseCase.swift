//
//  GetUserTokenUseCase.swift
//
//
//  Created by Victor Colen on 29/08/22.
//

import Foundation
import InjectionKit

public protocol GetUserTokenUseCaseProtocol {
    func callAsFunction() -> Date?
}

public struct GetUserTokenUseCase {
    @Injected var repository: LoginRepositoryProtocol

    public init() { }
}

extension GetUserTokenUseCase: GetUserTokenUseCaseProtocol {
    public func callAsFunction() -> Date? {
        repository.getUserToken()
    }
}
