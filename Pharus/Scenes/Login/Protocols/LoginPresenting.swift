//
//  LoginPresenting.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation

protocol LoginPresenting: Presenting {
    func isValidEmail(email: String) -> Bool
    func isValidPassword(password: String) -> Bool
    func loginUser(email: String, password: String) -> Bool
}
