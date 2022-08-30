//
//  StudentProjectsPresenting.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation
import CoreApp

protocol StudentProjectsPresenting: Presenting {
    var student: Student? { get }
    func getStudent() -> Student
    func showSubscribeAlert(of project: Project, at index: Int)
    func showStudentProject(project: Project)
}
