//
//  LogoutAlertViewController.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

class LogoutAlertViewController: UIViewController {

    // MARK: - Properties
    private lazy var alertView = LogoutAlertView()
    private let presenter: LogoutAlertPresenting

    // MARK: - Initializer
    init(presenter: LogoutAlertPresenting) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)

        presenter.attach(self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Super Methods
extension LogoutAlertViewController {

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
