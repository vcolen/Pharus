//
//  ProjectDetailRemoteDataSource.swift
//
//
//  Created by Victor Colen on 01/09/22.
//

import Foundation
import CoreKit

public protocol ProjectDetailRemoteDataSource {
    func toggleTaskCompletionUseCase(taskId: Int, projectId: Int)
    func getProject(id: Int) -> Project
}
