//
//  File.swift
//
//
//  Created by Victor Colen on 01/09/22.
//

import Foundation

public protocol ProjectDetailRepositoryProtocol {
    func toggleTaskCompletion(taskId: Int, projectId: Int)
}
