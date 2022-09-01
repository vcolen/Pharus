//
//  StudentProjectsViewable.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation
import CoreKit

protocol StudentProjectsViewable: AnyObject {
    func updateView(with student: Student)
}
