//
//  ProjectSheetPresenting.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation
import CoreApp

protocol ProjectSheetPresenting: Presenting {
    var project: ProjectModel { get }
    var projectSheetContent: ProjectSheetView.SheetContent { get }
    func popView()
}
