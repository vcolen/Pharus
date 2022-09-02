//
//  ProjectDetailRemoteDataSource.swift
//
//
//  Created by Victor Colen on 01/09/22.
//

import Foundation
import InjectionKit
import DataKit
import CoreKit

public struct ProjectDetailRemoteDataSource {
    @Injected var getStorageDataUseCaseProtocol: GetStorageDataUseCaseProtocol
    @Injected var setStorageDataUseCaseProtocol: SetStorageDataUseCaseProtocol

    public init() { }
}

extension ProjectDetailRemoteDataSource: DataKit.ProjectDetailRemoteDataSource {
    public func toggleTaskCompletionUseCase(taskId: Int, projectId: Int) {
        var student = getStorageDataUseCaseProtocol(
            Student.self,
            key: "student"
        )

        student?.projects[projectId - 1].tasks[taskId - 1].isComplete.toggle()

        setStorageDataUseCaseProtocol.callAsFunction(
            student,
            forKey: "student"
        )
    }

    public func getProject(id: Int) -> Project {
        guard let student = getStorageDataUseCaseProtocol(
            Student.self,
            key: "student"
        ) else {
            return Student.shared.projects[0]
        }

        return student.projects[id - 1]
    }
}
