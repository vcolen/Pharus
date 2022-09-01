//
//  StudentHomePresenting.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation
import CoreApp
import CoreKit

protocol StudentHomePresenting: Presenting {
    var student: Student? { get }
    func loadData()
}
