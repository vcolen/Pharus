//
//  ProjectSubcriptionPresenting.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation
import CoreApp
import CoreKit

protocol ProjectSubscriptionAlertPresenting: Presenting {
    var projectId: Int { get }
    func closeModal()
    func subscribeToProject()
    func loadData()
}
