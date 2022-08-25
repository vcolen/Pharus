//
//  ProjectSubcriptionPresenting.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation
import CoreApp

protocol ProjectSubscriptionAlertPresenting: Presenting {
    var project: ProjectModel { get }
    func closeModal()
    func subscribeToProject()
}
