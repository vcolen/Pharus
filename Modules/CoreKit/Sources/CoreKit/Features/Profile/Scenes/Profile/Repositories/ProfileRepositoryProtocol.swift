//
//  ProfileRepositoryProtocol.swift
//
//
//  Created by Victor Colen on 31/08/22.
//

import Foundation

public protocol ProfileRepositoryProtocol {
    func getStudent() -> Student
    func updateStudent(_ student: Student)
}
