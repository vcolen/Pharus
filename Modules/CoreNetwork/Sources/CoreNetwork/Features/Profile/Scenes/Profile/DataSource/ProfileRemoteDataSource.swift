//
//  ProfileRemoteDataSource.swift
//
//
//  Created by Victor Colen on 31/08/22.
//

import Foundation
import DataKit
import CoreKit
import InjectionKit

public struct ProfileRemoteDataSource {
    @Injected var setStorageDataUseCaseProtocol: SetStorageDataUseCaseProtocol
    @Injected var getStorageDataUseCaseProtocol: GetStorageDataUseCaseProtocol

    public init() {

    }
}

extension ProfileRemoteDataSource: DataKit.ProfileRemoteDataSource {
    public func getStudent() -> Student {
        return getStorageDataUseCaseProtocol(
            Student.self,
            key: "student"
        ) ?? Bundle.module.decode("Student.json")
    }

    public func updateStudent(_ student: Student) {
        setStorageDataUseCaseProtocol(student, forKey: "student")
    }
}
