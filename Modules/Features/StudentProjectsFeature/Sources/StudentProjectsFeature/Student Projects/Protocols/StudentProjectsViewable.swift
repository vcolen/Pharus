//
//  StudentProjectsViewable.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation
import CoreApp

protocol StudentProjectsViewable: AnyObject {
    func didFinishFetchingStudent(_ student: Student)
}
