//
//  StudentProjectsViewDelegate.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation
import CoreKit

protocol StudentProjectsViewDelegate: AnyObject {
    func subscribeButtonTapped(of project: Project, at index: Int)
    func projectCellTapped(for project: Project)
}
