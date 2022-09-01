//
//  ProjectsRemoteDataSource.swift
//
//
//  Created by Victor Colen on 01/09/22.
//

import Foundation
import InjectionKit
import DataKit
import CoreKit

public struct ProjectsRemoteDataSource {
    @Injected var setStorageDataUseCaseProtocol: SetStorageDataUseCaseProtocol
    @Injected var getStorageDataUseCaseProtocol: GetStorageDataUseCaseProtocol

    public init() { }
}

extension ProjectsRemoteDataSource: DataKit.ProjectsRemoteDataSource {
    public func subscribeToProject(projectId: Int) {
       guard var student = getStorageDataUseCaseProtocol(
            Student.self,
            key: "student"
       ) else { return }

        student.projects[projectId - 1].isSubscribed = true

        setStorageDataUseCaseProtocol(
            student,
            forKey: "student"
        )
    }
}
