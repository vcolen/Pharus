//
//  SingleButtonAlertView.swift
//  Pharus
//
//  Created by Victor Colen on 07/04/22.
//

import UIKit
import PharusUI

class SingleButtonAlertView: UIView {

    // MARK: - Properties
    weak var delegate: SingleButtonAlertViewDelegate?
    private var message: String
    private var type: AlertType

    enum AlertType {
        case confirmation
        case error
    }

    // MARK: - Views
    private lazy var mainStackView = VStackView([
        VStackView([
            alertIconImageView
        ]),

        VStackView([
            alertMessageLabel
        ]),

        actionButton
    ])
        .setting(\.spacing, to: 20)
        .padding(.all, 20)
        .setting(\.backgroundColor, to: .Modal.yellowBackground)
        .setting(\.layer.cornerRadius, to: 16)
        .padding([.leading, .trailing], 16)
        .frame(height: 217)
        .center(.vertically)
        .background(
            UIVisualEffectView(effect: UIBlurEffect(style: .light))
                .setting(\.frame, to: bounds)
                .setting(\.autoresizingMask, to: [.flexibleWidth, .flexibleHeight])
        )

    private lazy var alertIconImageView = UIImageView()
        .setting(\.image, to: .pharusIcons.checkIcon)
        .center(.allAxis)

    private lazy var alertMessageLabel = UILabel()
        .setting(\.textAlignment, to: .center)
        .setting(\.font, to: .mediumTitleBold)
        .setting(\.textColor, to: .black)

    private lazy var actionButton = MainCardButton(title: "Fechar", buttonState: .normal)

    // MARK: - Initializer
    init(
        message: String,
        type: AlertType
    ) {
        self.message = message
        self.type = type

        super.init(frame: .zero)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureSubviews() {

    }
}
// MARK: - View Codable
extension SingleButtonAlertView: ViewCodable {
    func buildHierarchy() {
        addSubview(mainStackView)
    }

    func setupConstraints() {
        mainStackView.edges()
    }

    func applyAdditionalChanges() {
        alertMessageLabel.text = message
        setupAlertIconImageView()
        setupActionButton()
    }
}

// MARK: - Delegate Actions
extension SingleButtonAlertView {
    func closeButtonTapped() {
        delegate?.closeButtonTapped()
    }
}

// MARK: - Additional Methods
extension SingleButtonAlertView {
    private func setupAlertIconImageView() {
        if type == .confirmation {
            alertIconImageView.originalView.image = .pharusIcons.checkIcon
        } else {
            alertIconImageView.originalView.image = .pharusIcons.errorIcon
        }
    }

    private func setupActionButton() {
        actionButton.setTitle("Fechar", for: .normal)
        actionButton.addAction(UIAction { [weak self] _ in
            self?.closeButtonTapped()
        }, for: .touchUpInside)
    }
}
