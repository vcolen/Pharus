//
//  LoginView.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 28/03/22.
//

import UIKit
import PharusUI

class LoginView: UIView {

    // MARK: - Properties
    weak var delegate: LoginViewDelegate?

    // MARK: - Views
    private lazy var mainStackView = VStackView([
        UIImageView()
            .setting(\.image, to: .pharusImages.appLogoImage)
            .setting(\.contentMode, to: .scaleAspectFit),

        UILabel()
            .setting(\.text, to: "Login")
            .setting(\.textColor, to: .Purple.pharusPurple)
            .setting(\.font, to: .largeTitleBold)
            .setting(\.textAlignment, to: .center),

        UIStackView([
            UILabel()
                .setting(\.text, to: "E-mail")
                .setting(\.font, to: .mediumTitleBold)
                .setting(\.textColor, to: .Purple.pharusPurple),

            emailTextField
        ])
        .setting(\.axis, to: .vertical)
        .setting(\.distribution, to: .fillEqually)
        .setting(\.alignment, to: .fill)
        .setting(\.spacing, to: 10),

        VStackView([
            UILabel()
                .setting(\.text, to: "Senha")
                .setting(\.font, to: .mediumTitleBold)
                .setting(\.textColor, to: .Purple.pharusPurple),

            passwordTextField,

            HStackView([
                wrongPasswordImageView,
                wrongPasswordLabel
            ])
            .setting(\.spacing, to: 4)
        ])
        .setting(\.distribution, to: .fillEqually)
        .setting(\.spacing, to: 10),

        loginButton,
        UIView()
    ])
    .setting(\.backgroundColor, to: .white)
    .setting(\.spacing, to: UIScreen.main.bounds.height/17)
    .setting(\.alignment, to: .fill)
    .padding([.leading, .trailing], 32)
    .padding([.top], 48)
    .safeArea([.top])

    lazy var emailTextField = UITextField()
        .setting(\.textColor, to: .black)
        .setting(\.font, to: .smallBody)
        .setting(\.layer.shadowColor, to: UIColor.Purple.pharusPurple.cgColor)
        .setting(\.layer.shadowOffset, to: CGSize(width: 0.0, height: 1.0))
        .setting(\.layer.shadowOpacity, to: 0.3)
        .setting(\.layer.shadowRadius, to: 0)
        .setting(\.backgroundColor, to: .white)
        .setting(\.autocorrectionType, to: .no)
        .setting(\.autocapitalizationType, to: .none)
        .setting(\.attributedPlaceholder,
                  to: NSAttributedString(
                    string: "antonia.ferreira@gmail.com",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
                  )
        )

    lazy var passwordTextField = UITextField()
        .setting(\.textColor, to: .black)
        .setting(\.font, to: .smallBody)
        .setting(\.layer.shadowColor, to: UIColor.Purple.pharusPurple.cgColor)
        .setting(\.layer.shadowOffset, to: CGSize(width: 0.0, height: 1.0))
        .setting(\.layer.shadowOpacity, to: 0.3)
        .setting(\.layer.shadowRadius, to: 0)
        .setting(\.backgroundColor, to: .white)
        .setting(\.autocorrectionType, to: .no)
        .setting(\.autocapitalizationType, to: .none)
        .setting(\.isSecureTextEntry, to: true)
        .setting(\.attributedPlaceholder,
                  to: NSAttributedString(
                    string: "Senha",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
                  )
        )

    lazy var wrongPasswordImageView = UIImageView()
        .setting(\.image, to: .pharusIcons.errorIcon?.withTintColor(.clear))
        .frame(width: 24)

    lazy var wrongPasswordLabel = UILabel()
        .setting(\.text, to: "Senha incorreta!")
        .setting(\.font, to: .smallBody)
        .setting(\.textColor, to: .clear)

    private lazy var loginButton = MainCardButton(title: "Entrar", buttonState: .normal)

    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewCodable
extension LoginView: ViewCodable {
    func buildHierarchy() {
        addSubview(mainStackView)
    }

    func setupConstraints() {
        mainStackView.edges()
    }

    func applyAdditionalChanges() {
        self.backgroundColor = .white
        setupLoginButton()
    }
}

// MARK: - Delegate Actions
extension LoginView: LoginViewDelegate {
    func loginButtonPressed() {
        delegate?.loginButtonPressed()
    }
}

// MARK: - Additional Methods
extension LoginView {
    private func setupLoginButton() {
        loginButton.titleLabel?.font = .largeButton
        loginButton.addAction(UIAction { [weak self] _ in
            self?.loginButtonPressed()
        }, for: .touchUpInside)
    }
}
