//
//  StudentProfileViewable.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation
import CoreKit

protocol StudentProfileViewable: AnyObject {
    func updateView(with: Student)
}
