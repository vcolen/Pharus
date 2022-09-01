//
//  LoginLocalDataSource.swift
//
//
//  Created by Victor Colen on 29/08/22.
//

import Foundation
import DataKit

public struct LoginLocalDataSource {
    public init() {

    }
}

extension LoginLocalDataSource: DataKit.LoginLocalDataSource {
    public func getUserToken() -> String {
        return "Token"
    }
}
