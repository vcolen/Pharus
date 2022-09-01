//
//  StudentHomeViewable.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation
import CoreKit

protocol StudentHomeViewable: AnyObject {
    func updateView(with: Student)
}
