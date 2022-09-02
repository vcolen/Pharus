//
//  ProjectSubscriptionAlertViewController.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit
import CoreKit

class ProjectSubscriptionAlertViewController: UIViewController {

    // MARK: - Properties
    private lazy var customView = ProjectSubscriptionAlertView()
    private let presenter: ProjectSubscriptionAlertPresenting

    // MARK: - Initializer
    init(presenter: ProjectSubscriptionAlertPresenting) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)

        presenter.attach(self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Super Methods
extension ProjectSubscriptionAlertViewController {

    override func loadView() {
        self.view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        customView.delegate = self
        presenter.loadData()
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
extension ProjectSubscriptionAlertViewController: ProjectSubscriptionAlertViewable {
    func updateView(with project: Project) {
        customView.updateView(with: project)
    }
}
