//
//  ProjectSubcriptionAlertViewController.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

class ProjectSubcriptionAlertViewController: UIViewController {

    // MARK: - Properties

    private let alertView: ProjectSubcriptionAlertView
    private let presenter: ProjectSubcriptionAlertPresenter

    // MARK: - Initializer

    init(presenter: ProjectSubcriptionAlertPresenter) {
        self.presenter = presenter
        self.alertView = ProjectSubcriptionAlertView(
            title: "Confirmar Inscrição",
            message: "Você deseja se inscrever no projeto \"\(presenter.project.name)\"?",
            mainButtonText: "Sim, quero me inscrever",
            secondaryButtonText: "Não quero, mudei de idéia"
        )

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        alertView.delegate = self
        self.view = alertView

    }
}

// MARK: - Project Subcription Alert View Delegate

extension ProjectSubcriptionAlertViewController: ProjectSubcriptionAlertViewDelegate {
    func closeButtonTapped() {
        presenter.closeModal()
    }

    func primaryButtonTapped() {
        presenter.subscribeToProject()
    }

    func secondaryButtonTapped() {
        presenter.closeModal()
    }
}

// MARK: - Project Subscription Alert Viewable

extension ProjectSubcriptionAlertViewController: ProjectSubcriptionAlertViewable { }
