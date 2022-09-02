//
//  ProjectSheetPresenting.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation
import CoreApp
import CoreKit

protocol ProjectSheetPresenting: Presenting {
    var projectId: Int { get }
    var projectSheetContent: ProjectSheetView.SheetContent { get }
    func popView()
    func loadData()
}
