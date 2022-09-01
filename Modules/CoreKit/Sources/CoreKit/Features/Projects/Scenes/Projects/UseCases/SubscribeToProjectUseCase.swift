//
//  SubscribeToProjectUseCase.swift
//
//
//  Created by Victor Colen on 01/09/22.
//

import Foundation
import InjectionKit

public protocol SubscribeToProjectUseCaseProtocol {
    func callAsFunction(projectId: Int)
}

public struct SubscribeToProjectUseCase {
    @Injected var repository: ProjectsRepositoryProtocol

    public init() { }
}

extension SubscribeToProjectUseCase: SubscribeToProjectUseCaseProtocol {
    public func callAsFunction(projectId: Int) {
        repository.subscribeToProject(projectId: projectId)
    }
}
