//
//  StudentProjectsCoordinating.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation
import CoreKit

protocol StudentProjectsCoordinating {
    func showStudentProject(_ project: Project)
    func showSubscribeAlert(
        of project: Project,
        onCommit commitHandler: @escaping () -> Void
    )
}
