//
//  SingleButtonAlertViewController.swift
//  Pharus
//
//  Created by Victor Colen on 07/04/22.
//

import UIKit

class SingleButtonAlertViewController: UIViewController {

    // MARK: - Properties
    private lazy var alertView = SingleButtonAlertView(
        message: presenter.alertMessage,
        type: presenter.alertType
    )
    private let presenter: SingleButtonAlertPresenter

    // MARK: - Initializer
    init(presenter: SingleButtonAlertPresenter) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Super Methods
extension SingleButtonAlertViewController {

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
