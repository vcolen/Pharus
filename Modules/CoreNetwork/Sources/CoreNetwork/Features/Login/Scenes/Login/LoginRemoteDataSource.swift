//
//  LoginRemoteDataSource.swift
//
//
//  Created by Victor Colen on 25/08/22.
//

import Foundation
import DataKit

public struct LoginRemoteDataSource {
    public init() { }
}

extension LoginRemoteDataSource: DataKit.LoginRemoteDataSource {
    public func loginUser(email: String, password: String) -> Bool {
       // return email == "antonia.ferreira@gmail.com" && password == "Atn4273!"
        return true
    }
}
