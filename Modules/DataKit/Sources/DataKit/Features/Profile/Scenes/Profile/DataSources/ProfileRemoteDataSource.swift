//
//  ProfileRemoteDataSource.swift
//
//
//  Created by Victor Colen on 31/08/22.
//

import Foundation
import CoreKit

public protocol ProfileRemoteDataSource {
    func getStudent() -> Student
    func updateStudent(_ student: Student)
}
