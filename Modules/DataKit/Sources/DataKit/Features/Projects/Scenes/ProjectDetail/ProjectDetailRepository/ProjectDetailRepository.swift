//
//  File.swift
//
//
//  Created by Victor Colen on 01/09/22.
//

import Foundation
import InjectionKit
import CoreKit

public struct ProjectDetailRepository {
    @Injected var remoteDataSource: ProjectDetailRemoteDataSource

    public init() { }
}

extension ProjectDetailRepository: ProjectDetailRepositoryProtocol {
    public func toggleTaskCompletion(taskId: Int, projectId: Int) {
        remoteDataSource.toggleTaskCompletionUseCase(taskId: taskId, projectId: projectId)
    }

    public func getProject(id: Int) -> Project {
        remoteDataSource.getProject(id: id)
    }
}
