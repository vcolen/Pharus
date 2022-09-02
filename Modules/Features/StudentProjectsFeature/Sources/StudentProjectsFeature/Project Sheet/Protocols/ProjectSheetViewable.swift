//
//  ProjectSheetViewable.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation
import CoreKit

protocol ProjectSheetViewable: AnyObject {
    func updateView(with project: Project)
}
