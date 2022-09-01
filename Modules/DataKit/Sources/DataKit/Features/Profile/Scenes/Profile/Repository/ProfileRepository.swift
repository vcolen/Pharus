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

extension ProfileRepository: ProfileRepositoryProtocol {
    public func getStudent() -> Student {
        remoteDataSource.getStudent()
    }
}
