//
//  UpdateStudentUseCase.swift
//
//
//  Created by Victor Colen on 01/09/22.
//

import Foundation
import InjectionKit

public protocol UpdateStudentUseCaseProtocol {
    func callAsFunction(_ student: Student)
}

public struct UpdateStudentUseCase {
    @Injected var repository: ProfileRepositoryProtocol

    public init() {

    }
}

extension UpdateStudentUseCase: UpdateStudentUseCaseProtocol {
    public func callAsFunction(_ student: Student) {
        repository.updateStudent(student)
    }
}
