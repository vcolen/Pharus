//
//  LoginLocalDataSource.swift
//
//
//  Created by Victor Colen on 29/08/22.
//

import Foundation

public protocol LoginLocalDataSource {
    func getUserToken() -> Date?
    func setUserToken()
}
