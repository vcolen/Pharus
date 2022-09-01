//
//  StudentProfilePresenting.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation
import CoreApp
import CoreKit

protocol StudentProfilePresenting: Presenting {
    var student: Student? { get }
    func showLogoutAlert()
    func loadData()
}
