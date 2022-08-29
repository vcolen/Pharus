//
//  File.swift
//
//
//  Created by Victor Colen on 25/08/22.
//

import Foundation
import CoreKit
import InjectionKit

public struct LoginRepository {
    @Injected var remoteDataSource: LoginRemoteDataSource
    @Injected var localDataSource: LoginLocalDataSource

    public init() { }
}

extension LoginRepository: LoginRepositoryProtocol {
    public func loginUser(email: String, password: String) -> Bool {
        remoteDataSource.loginUser(email: email, password: password)
    }

    public func getUserToken() -> String {
        localDataSource.getUserToken()
    }
}
