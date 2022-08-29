//
//  LoginUserUseCaseProtocol.swift
//
//
//  Created by Victor Colen on 25/08/22.
//

import Foundation
import InjectionKit

public protocol LoginUserUseCaseProtocol {
    func callAsFunction(email: String, password: String) -> Bool
}

public struct LoginUserUseCase {
    @Injected var repository: LoginRepositoryProtocol

    public init() { }
}

extension LoginUserUseCase: LoginUserUseCaseProtocol {
    public func callAsFunction(email: String, password: String) -> Bool {
        repository.loginUser(email: email, password: password)
    }
}
