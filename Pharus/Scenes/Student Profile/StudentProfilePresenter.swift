//
//  StudentProfilePresenter.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 16/04/22.
//

import Foundation

class StudentProfilePresenter {

    // MARK: - Properties

    private var coordinator: StudentProfileCoordinator

    // MARK: - Initializer

    init(coordinator: StudentProfileCoordinator) {
        self.coordinator = coordinator
    }
}

// MARK: - Actions

extension StudentProfilePresenter: StudentProfilePresenting {
    func showLogoutAlert() {
        coordinator.showLogOutAlert()
    }
}
