//
//  StudentProjectsRankingPresenting.swift
//  Pharus
//
//  Created by Victor Colen on 20/06/22.
//

import Foundation
import CoreApp
import CoreKit

protocol StudentProjectsRankingPresenting: Presenting {
    var student: Student? { get }
    func loadData()
}
