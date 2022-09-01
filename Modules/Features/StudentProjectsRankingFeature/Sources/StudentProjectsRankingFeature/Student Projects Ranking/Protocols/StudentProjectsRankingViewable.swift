//
//  StudentProjectsRankingViewable.swift
//  Pharus
//
//  Created by Victor Colen on 20/06/22.
//

import Foundation
import CoreKit

protocol StudentProjectsRankingViewable: AnyObject {
    func updateView(with projects: [Project])
}
