//
//  GetProjectUseCase.swift
//
//
//  Created by Victor Colen on 02/09/22.
//

import Foundation
import InjectionKit

public protocol GetProjectUseCaseProtocol {
    func callAsFunction(id: Int) -> Project
}

public struct GetProjectUseCase {
    @Injected var repository: ProjectDetailRepositoryProtocol

    public init() { }
}

extension GetProjectUseCase: GetProjectUseCaseProtocol {
    public func callAsFunction(id: Int) -> Project {
        repository.getProject(id: id)
    }
}
