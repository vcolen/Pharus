//
//  StudentProjectsPresenting.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation

protocol StudentProjectsPresenting: Presenting {
    var student: StudentModel { get }
    func showSubscribeAlert(of project: ProjectModel)
    func showStudentProject(project: ProjectModel)
}
