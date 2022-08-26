//
//  File.swift
//
//
//  Created by Victor Colen on 25/08/22.
//

import Foundation
import InjectionKit

public protocol LoginUserUseCaseProtocol {
    func callAsFunction(email: String, password: String) -> Bool
}

public struct LoginUserUseCase {
    @Injected var repository: LoginRepositoryProtocol

    public init() { }
}

extension LoginUserUseCase: LoginUserUseCaseProtocol {
    public func callAsFunction(email: String, password: String) -> Bool {
        repository.loginUser(email: email, password: password)
    }
}

// func loginUser(email: String, password: String) -> Bool {
//    if email == student.email && password == student.password {
//        let studentModel = makeStudentModel(with: student)
//        StudentManager.shared.update(student: studentModel)
//        coordinator.showHome(student: studentModel)
//        return true
//    }
//    return false
// }
//
// func makeStudentModel(with student: Student) -> StudentModel {
//    var projectModelArray = [ProjectModel]()
//    for project in student.projects {
//        var taskModelArray = [TaskModel]()
//        for task in project.tasks {
//            let taskModel = TaskModel(title: task.title, isComplete: task.isComplete,
//                                      description: task.taskDescription
//            )
//            taskModelArray.append(taskModel)
//        }
//        let projectModel = ProjectModel(
//            id: project.id,
//            name: project.name,
//            isSubscribed: project.isSubscribed,
//            isComplete: project.isComplete,
//            score: project.score,
//            placement: project.placement,
//            projectDescription: project.projectDescription,
//            scoreDescription: project.scoreDescription,
//            startDate: project.startDate,
//            endDate: project.endDate,
//            school: project.school,
//            mentor: project.mentor,
//            company: project.company,
//            tasks: taskModelArray
//        )
//        projectModelArray.append(projectModel)
//    }
//    let studentModel = StudentModel(
//        id: student.id,
//        firstName: student.firstName,
//        lastName: student.lastName,
//        birthdate: student.birthdate,
//        gender: student.gender,
//        school: student.school,
//        year: student.year,
//        city: student.city,
//        schoolShift: student.schoolShift,
//        avatar: student.avatar,
//        email: student.email,
//        password: student.password,
//        username: student.username,
//        projects: projectModelArray
//    )
//    return studentModel
// }
