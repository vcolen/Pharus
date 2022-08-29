//
//  AvatarSelectionPresenting.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation
import CoreApp

protocol AvatarSelectionPresenting: Presenting {
    var student: Student { get }
    func changeStudentAvatar(to avatar: String)
    func loadData()
    func submit()
}
