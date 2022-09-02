//
//  LoginRepositoryProtocol.swift
//
//
//  Created by Victor Colen on 25/08/22.
//

import Foundation

public protocol LoginRepositoryProtocol {
    func loginUser(email: String, password: String) -> Bool
    func getUserToken() -> Date?
    func setUserToken()
}
