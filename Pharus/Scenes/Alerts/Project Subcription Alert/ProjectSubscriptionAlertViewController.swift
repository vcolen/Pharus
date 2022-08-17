//
//  ProjectSubscriptionAlertViewController.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

class ProjectSubscriptionAlertViewController: UIViewController {

    // MARK: - Properties
    private lazy var alertView = ProjectSubscriptionAlertView(
        title: "Confirmar Inscrição",
        message: "Você deseja se inscrever no projeto \"\(presenter.project.name)\"?",
        mainButtonText: "Sim, quero me inscrever",
        secondaryButtonText: "Não quero, mudei de idéia"
    )
    private let presenter: ProjectSubscriptionAlertPresenting

    // MARK: - Initializer
    init(presenter: ProjectSubscriptionAlertPresenting) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Super Methods
extension ProjectSubscriptionAlertViewController {

    override func loadView() {
        self.view = alertView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        alertView.delegate = self
    }
}

// MARK: - Project Subcription Alert View Delegate
extension ProjectSubscriptionAlertViewController: ProjectSubscriptionAlertViewDelegate {
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
extension ProjectSubscriptionAlertViewController: ProjectSubscriptionAlertViewable { }
