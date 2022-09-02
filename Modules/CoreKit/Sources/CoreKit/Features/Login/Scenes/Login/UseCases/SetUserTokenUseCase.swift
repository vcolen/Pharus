//
//  SetUserTokenUseCase.swift
//
//
//  Created by Victor Colen on 02/09/22.
//

import Foundation
import InjectionKit

public protocol SetUserTokenUseCaseProtocol {
    func callAsFunction()
}

public struct SetUserTokenUseCase {
    @Injected var repository: LoginRepositoryProtocol

    public init() { }
}

extension SetUserTokenUseCase: SetUserTokenUseCaseProtocol {
    public func callAsFunction() {
        repository.setUserToken()
    }
}
