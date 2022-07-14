//
//  StudentProjectsViewDelegate.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation

protocol StudentProjectsViewDelegate: AnyObject {
    func subscribeButtonTapped(of project: ProjectModel, at index: Int)
    func projectCellTapped(for project: ProjectModel)
}
