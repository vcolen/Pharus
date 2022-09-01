//
//  ProjectDetailRemoteDataSource.swift
//
//
//  Created by Victor Colen on 01/09/22.
//

import Foundation

public protocol ProjectDetailRemoteDataSource {
    func toggleTaskCompletionUseCase(taskId: Int, projectId: Int)
}
