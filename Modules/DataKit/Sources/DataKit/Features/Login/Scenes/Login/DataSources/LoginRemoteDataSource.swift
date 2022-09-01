//
//  LoginRemoteDataSource.swift
//
//
//  Created by Victor Colen on 25/08/22.
//

import Foundation

public protocol LoginRemoteDataSource {
    func loginUser(email: String, password: String) -> Bool
}
