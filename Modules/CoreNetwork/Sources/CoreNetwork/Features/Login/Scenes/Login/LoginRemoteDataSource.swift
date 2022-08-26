//
//  LoginRemoteDataSource.swift
//
//
//  Created by Victor Colen on 25/08/22.
//

import Foundation
import DataKit

public struct LoginRemoteDataSource {
    public init() { }
}

extension LoginRemoteDataSource: DataKit.LoginRemoteDataSource {
    public func loginUser(email: String, password: String) -> Bool {
       // return email == "antonia.ferreira@gmail.com" && password == "Atn4273!"
        return true
    }
}

#warning("StudentModel")
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
