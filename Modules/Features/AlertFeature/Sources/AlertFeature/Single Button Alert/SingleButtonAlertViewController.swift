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
    private let presenter: SingleButtonAlertPresenting

    // MARK: - Initializer
    init(presenter: SingleButtonAlertPresenting) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)

        presenter.attach(self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Super Methods
extension SingleButtonAlertViewController {

    override func loadView() {
        self.view = alertView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        alertView.delegate = self
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
