//
//  AvatarSelectionPresenting.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation

protocol AvatarSelectionPresenting: Presenting {
    var student: StudentModel { get }
    func changeStudentAvatar(to avatar: String)
}
