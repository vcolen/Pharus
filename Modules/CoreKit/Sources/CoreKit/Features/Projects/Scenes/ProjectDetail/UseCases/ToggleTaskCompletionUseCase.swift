//
//  ToggleTaskCompletionUseCase.swift
//
//
//  Created by Victor Colen on 01/09/22.
//

import Foundation
import InjectionKit

public protocol ToggleTaskCompletionUseCaseProtocol {
    func callAsFunciton(taskId: Int, projectId: Int)
}

public struct ToggleTaskCompletionUseCase {
    @Injected var repository: ProjectDetailRepositoryProtocol

    public init() { }
}

extension ToggleTaskCompletionUseCase: ToggleTaskCompletionUseCaseProtocol {
    public func callAsFunciton(taskId: Int, projectId: Int) {
        repository.toggleTaskCompletion(taskId: taskId, projectId: projectId)
    }
}
