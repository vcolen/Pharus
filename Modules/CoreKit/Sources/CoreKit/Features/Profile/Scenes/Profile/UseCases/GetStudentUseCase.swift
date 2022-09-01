//
//  GetStudentUseCase.swift
//
//
//  Created by Victor Colen on 29/08/22.
//

import Foundation
import CoreApp
import InjectionKit

public protocol GetStudentUseCaseProtocol {
    func callAsFunction() -> Student
}

public struct GetStudentUseCase {
    @Injected var repository: ProfileRepositoryProtocol

    public init() { }
}

extension GetStudentUseCase: GetStudentUseCaseProtocol {
    public func callAsFunction() -> Student {
        repository.getStudent()
    }
}
