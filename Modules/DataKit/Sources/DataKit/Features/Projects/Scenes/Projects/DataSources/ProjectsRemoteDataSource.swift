//
//  ProjectsRemoteDataSource.swift
//
//
//  Created by Victor Colen on 01/09/22.
//

import Foundation

public protocol ProjectsRemoteDataSource {
    func subscribeToProject(projectId: Int)
}
