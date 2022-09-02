//
//  StudentProjectDetailViewable.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation
import CoreKit

protocol StudentProjectDetailViewable: AnyObject {
    func updateView(with project: Project)
}
