//
//  StudentManager.swift
//  Pharus
//
//  Created by Victor Colen on 13/07/22.
//

import Foundation

class StudentManager {
    var student: StudentModel
    static var shared = StudentManager(student: StudentModel())

    init(student: StudentModel) {
        self.student = student
    }

    func getStudent() -> StudentModel {
        return student
    }

    func update(student: StudentModel) {
        self.student = student
    }
}
