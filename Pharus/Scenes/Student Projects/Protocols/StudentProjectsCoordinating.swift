//
//  StudentProjectsCoordinating.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation

protocol StudentProjectsCoordinating {
    func showStudentProject(_ project: ProjectModel)
    func showSubscribeAlert(
        of project: ProjectModel,
        onCommit commitHandler: @escaping () -> Void
    )
}
