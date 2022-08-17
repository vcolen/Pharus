//
//  ProjectSheetPresenting.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation

protocol ProjectSheetPresenting: Presenting {
    var project: ProjectModel { get }
    var projectSheetContent: ProjectSheetView.SheetContent { get }
    func popView()
}
