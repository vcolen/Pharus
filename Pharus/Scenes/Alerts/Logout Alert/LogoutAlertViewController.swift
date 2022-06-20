//
//  LogoutAlertViewController.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

class LogoutAlertViewController: UIViewController {

    // MARK: - Properties

    private let alertView: LogoutAlertView
    private let presenter: LogoutAlertPresenter

    // MARK: - Initializer

    init(presenter: LogoutAlertPresenter) {

        self.alertView = LogoutAlertView()
        self.presenter = presenter

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

// MARK: - Logout Alert View Delegate

extension LogoutAlertViewController: LogoutAlertViewDelegate {

    func primaryButtonTapped() {
        presenter.logout()
    }

    func secondaryButtonTapped() {
        presenter.closeModal()
    }
}

// MARK: - Logout Alert Viewable

extension LogoutAlertViewController: LogoutAlertViewable { }
