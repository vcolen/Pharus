//
//  StudentProjectsViewDelegate.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation

protocol StudentProjectsViewDelegate: AnyObject {
    func subscribeButtonTapped(of project: ProjectModel)
    func projectCellTapped(for project: ProjectModel)
}
