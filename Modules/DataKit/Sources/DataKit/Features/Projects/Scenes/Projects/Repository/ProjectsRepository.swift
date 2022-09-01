//
//  ProjectsRepository.swift
//
//
//  Created by Victor Colen on 01/09/22.
//

import Foundation
import CoreKit
import InjectionKit

public struct ProjectsRepository {
    @Injected var remoteDataSource: ProjectsRemoteDataSource

    public init() { }
}

extension ProjectsRepository: ProjectsRepositoryProtocol {
    public func subscribeToProject(projectId: Int) {
        remoteDataSource.subscribeToProject(projectId: projectId)
    }
}
