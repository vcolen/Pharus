//
//  SingleButtonAlertViewController.swift
//  Pharus
//
//  Created by Victor Colen on 07/04/22.
//

import UIKit

class SingleButtonAlertViewController: UIViewController {

    // MARK: - Properties

    private var alertView: SingleButtonAlertView
    private var presenter: SingleButtonAlertPresenter

    // MARK: - Initializer

    init(
        presenter: SingleButtonAlertPresenter
    ) {

        self.presenter = presenter
        self.alertView = SingleButtonAlertView(
            message: presenter.alertMessage,
            type: presenter.alertType
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

// MARK: - Single Button Alert View Delegate

extension SingleButtonAlertViewController: SingleButtonAlertViewDelegate {
    func closeButtonTapped() {
        presenter.closeModal()
    }
}

// MARK: - Single Button Alert Viewable

extension SingleButtonAlertViewController: SingleButtonAlertViewable { }
