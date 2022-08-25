//
//  SendFilePresenter.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import UIKit
import CoreApp

class SendFilePresenter: BasePresenter<SendFileViewable>, SendFilePresenting {

    // MARK: - Properties
    let coordinator: SendFileCoordinating

    // MARK: - Initializer
    init(coordinator: SendFileCoordinating) {
        self.coordinator = coordinator
    }

    // MARK: - Actions
    func sendFile() {
        coordinator.showFileSentAlert()
    }

    func closeSheet() {
        coordinator.closeSheet()
    }
}
