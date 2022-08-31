//
//  AvatarSelectionPresenter.swift.swift
//  Pharus
//
//  Created by Victor Colen on 20/06/22.
//

import UIKit
import CoreApp
import InjectionKit
import CoreKit

class AvatarSelectionPresenter: BasePresenter<AvatarSelectionViewable> {

    // MARK: - Properties
    private let coordinator: AvatarSelectionCoordinating
    var student: Student?
    @Injected var getStudentUseCaseProtocol: GetStudentUseCaseProtocol

    // MARK: - Initializer
    init(coordinator: AvatarSelectionCoordinating) {
        self.coordinator = coordinator
    }
}

// MARK: - Avatar Selection Presenting
extension AvatarSelectionPresenter: AvatarSelectionPresenting {
    func changeStudentAvatar(to avatar: String) {
        #warning("implementar funcao para salvar o avatar")
    }
}

extension AvatarSelectionPresenter {
    func submit() {
        #warning("implementar salvar os dados")
    }

    func loadData() {
        view?.updateView(with: getStudentUseCaseProtocol())
    }
}
