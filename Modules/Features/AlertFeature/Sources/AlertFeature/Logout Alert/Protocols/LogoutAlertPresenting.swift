//
//  LogoutAlertPresenting.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation
import CoreApp

protocol LogoutAlertPresenting: Presenting {
    func closeModal()
    func logout()
}