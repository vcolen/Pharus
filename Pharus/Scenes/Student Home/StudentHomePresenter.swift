//
//  StudentHomePresenter.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import Foundation

class StudentHomePresenter: StudentHomePresenting {

    // MARK: - Properties

   private var coordinator: StudentHomeCoordinator

    // MARK: - Initializer

    init(coordinator: StudentHomeCoordinator) {
        self.coordinator = coordinator
    }
}
