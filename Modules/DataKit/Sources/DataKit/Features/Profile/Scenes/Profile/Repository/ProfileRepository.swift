//
//  ProfileRepository.swift
//
//
//  Created by Victor Colen on 31/08/22.
//

import Foundation
import InjectionKit
import CoreKit

public struct ProfileRepository {
    @Injected var remoteDataSource: ProfileRemoteDataSource

    public init() { }
}

// MARK: - Remote Data Source
extension ProfileRepository: ProfileRepositoryProtocol {
    public func getStudent() -> Student {
        remoteDataSource.getStudent()
    }

    public func updateStudent(_ student: Student) {
        remoteDataSource.updateStudent(student)
    }
}
