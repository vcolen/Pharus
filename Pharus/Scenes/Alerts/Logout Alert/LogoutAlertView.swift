//
//  LogoutAlertView.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit
import PharusUI

class LogoutAlertView: UIView {

    // MARK: - Properties
    weak var delegate: LogoutAlertViewDelegate?

    // MARK: - Views
    private lazy var blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        .setting(\.frame, to: bounds)
        .setting(\.autoresizingMask, to: [.flexibleWidth, .flexibleHeight])

    private lazy var mainStackView = VStackView([
        logoutIconHelperView,
        titleLabel,
        buttonStackView
    ])
        .padding([.top], 26)
        .padding([.leading, .trailing], 18)
        .padding([.bottom], 16)
        .setting(\.backgroundColor, to: .Modal.yellowBackground)
        .setting(\.layer.cornerRadius, to: 16)
        .padding([.leading, .trailing], 16)
        .frame(height: 217)
        .center(.vertically)

    private lazy var logoutIconHelperView = VStackView([
        logoutIconImageView
    ])
        .frame(height: 50)

    private lazy var logoutIconImageView = UIImageView()
        .setting(\.image, to: .pharusIcons.logoutIcon?.withTintColor(.black))
        .frame(width: 48, height: 48)
        .center(.allAxis)

    private lazy var titleLabel = UILabel()
        .setting(\.text, to: "Deseja sair da sua conta?")
        .setting(\.textAlignment, to: .center)
        .setting(\.font, to: .mediumTitleBold)
        .setting(\.textColor, to: .black)

    private lazy var buttonStackView = HStackView([
        primaryButton,
        secondaryButton
    ])
        .setting(\.spacing, to: 39)
        .setting(\.distribution, to: .fillEqually)

    private lazy var primaryButton = SmallAlertButton(title: "Sair", importance: .primary)

    private lazy var secondaryButton = SmallAlertButton(title: "Cancelar", importance: .secondary)

    // MARK: - Initilizer
    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Codable
extension LogoutAlertView: ViewCodable {
    func buildHierarchy() {
        addSubview(blurEffectView)
        addSubview(mainStackView)
    }

    func setupConstraints() {
        mainStackView.edges()
    }

    func applyAdditionalChanges() {
        primaryButton.addAction(UIAction { [weak self] _ in
            self?.primaryButtonTapped()
        }, for: .touchUpInside)

        secondaryButton.addAction(UIAction { [weak self] _ in
            self?.secondaryButtonTapped()
        }, for: .touchUpInside)
    }
}

// MARK: - Delegate Actions
extension LogoutAlertView {
    func primaryButtonTapped() {
        delegate?.primaryButtonTapped()
    }

    func secondaryButtonTapped() {
        delegate?.secondaryButtonTapped()
    }
}
