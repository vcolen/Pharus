//
//  SingleButtonAlertPresenting.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation
import CoreApp

protocol SingleButtonAlertPresenting: Presenting {
    var alertType: SingleButtonAlertView.AlertType { get }
    var alertMessage: String { get }
    func closeModal()
}
