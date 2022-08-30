//
//  StudentHomePresenting.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation
import CoreApp

protocol StudentHomePresenting: Presenting {
    var student: Student? { get }
    func loadData()
}
