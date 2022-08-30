//
//  GetStudentUseCase.swift
//
//
//  Created by Victor Colen on 29/08/22.
//

import Foundation
import CoreApp

public protocol GetStudentUseCaseProtocol {
    func callAsFunction() -> Student
}

public struct GetStudentUseCase {
    public init() { }
}

extension GetStudentUseCase: GetStudentUseCaseProtocol {
    public func callAsFunction() -> Student {
        return Student.shared
    }
}
