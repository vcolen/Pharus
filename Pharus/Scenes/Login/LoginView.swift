//
//  LoginView.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 28/03/22.
//

import UIKit
import PharusUI

class LoginView: UIView, ViewCodable {

    // MARK: - Properties
    weak var delegate: LoginViewDelegate?

    // MARK: - Views
    private lazy var mainView = UIView()
        .setting(\.backgroundColor, to: .white)
        .setting(\.translatesAutoresizingMaskIntoConstraints, to: false)

    private lazy var logoImageView = UIImageView()
        .setting(\.image, to: .pharusImages.appLogoImage)
        .setting(\.contentMode, to: .scaleAspectFit)
        .setting(\.translatesAutoresizingMaskIntoConstraints, to: false)

    private lazy var mainStackView = VStackView([
        logoImageView,
        loginTitle,
        emailStackView,
        passwordStackView,
        loginButton
    ])
        .setting(\.spacing, to: UIScreen.main.bounds.height/17)
        .setting(\.alignment, to: .fill)
        .setting(\.translatesAutoresizingMaskIntoConstraints, to: false)
        .padding([.leading, .trailing], 32)
        .padding([.top], 48)
        .safeArea([.top])

    private lazy var loginTitle = UILabel()
        .setting(\.text, to: "Login")
        .setting(\.textColor, to: .Purple.pharusPurple)
        .setting(\.font, to: .largeTitleBold)
        .setting(\.textAlignment, to: .center)
        .setting(\.translatesAutoresizingMaskIntoConstraints, to: false)

    private lazy var emailStackView = UIStackView([
        emailLabel,
        emailTextField
    ])
        .setting(\.axis, to: .vertical)
        .setting(\.distribution, to: .fillEqually)
        .setting(\.alignment, to: .fill)
        .setting(\.spacing, to: 10)
        .setting(\.translatesAutoresizingMaskIntoConstraints, to: false)

    private lazy var emailLabel = UILabel()
        .setting(\.text, to: "E-mail")
        .setting(\.font, to: .mediumTitleBold)
        .setting(\.textColor, to: .Purple.pharusPurple)
        .setting(\.translatesAutoresizingMaskIntoConstraints, to: false)

    lazy var emailTextField = UITextField()
        .setting(\.attributedPlaceholder,
                  to: NSAttributedString(
                    string: "antonia.ferreira@gmail.com",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
                  )
        )
        .setting(\.textColor, to: .black)
        .setting(\.font, to: .smallBody)
        .setting(\.layer.shadowColor, to: UIColor.Purple.pharusPurple.cgColor)
        .setting(\.layer.shadowOffset, to: CGSize(width: 0.0, height: 1.0))
        .setting(\.layer.shadowOpacity, to: 0.3)
        .setting(\.layer.shadowRadius, to: 0)
        .setting(\.backgroundColor, to: .white)
        .setting(\.autocorrectionType, to: .no)
        .setting(\.autocapitalizationType, to: .none)
        .setting(\.translatesAutoresizingMaskIntoConstraints, to: false)

    private lazy var passwordStackView = VStackView([
        passwordLabel,
        passwordTextField,
        wrongPasswordStackView
    ])
        .setting(\.distribution, to: .fillEqually)
        .setting(\.alignment, to: .fill)
        .setting(\.spacing, to: 10)
        .setting(\.translatesAutoresizingMaskIntoConstraints, to: false)

    private lazy var passwordLabel = UILabel()
        .setting(\.text, to: "Senha")
        .setting(\.font, to: .mediumTitleBold)
        .setting(\.textColor, to: .Purple.pharusPurple)
        .setting(\.translatesAutoresizingMaskIntoConstraints, to: false)

    lazy var passwordTextField = UITextField()
        .setting(\.attributedPlaceholder,
                  to: NSAttributedString(
                    string: "Senha",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
                  )
        )
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
        .setting(\.translatesAutoresizingMaskIntoConstraints, to: false)

    private lazy var wrongPasswordStackView = HStackView([
        wrongPasswordImageView,
        wrongPasswordLabel
    ])
        .setting(\.spacing, to: 4)
        .setting(\.translatesAutoresizingMaskIntoConstraints, to: false)

    lazy var wrongPasswordImageView = UIImageView()
        .setting(\.image, to: .pharusIcons.errorIcon?.withTintColor(.clear))
        .setting(\.translatesAutoresizingMaskIntoConstraints, to: false)

    lazy var wrongPasswordLabel = UILabel()
        .setting(\.text, to: "Senha incorreta!")
        .setting(\.font, to: .smallBody)
        .setting(\.textColor, to: .clear)
        .setting(\.translatesAutoresizingMaskIntoConstraints, to: false)

    private lazy var loginButton = MainCardButton(title: "Entrar", buttonState: .normal)
        .setting(\.translatesAutoresizingMaskIntoConstraints, to: false)

    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews
    func buildHierarchy() {
        addSubview(mainView)
        mainView.addSubview(mainStackView)
    }

    // MARK: - Constraints
    func setupConstraints() {
        // Main View
        mainView.edges()

        // Main Stack View
        //        NSLayoutConstraint.activate([
        //            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 48),
        //            mainStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 32),
        //            mainStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -32)
        //        ])

        // Wrong password Image View
        wrongPasswordImageView.setWidth(to: 24)
    }

    func applyAdditionalChanges() {
        loginButton.addAction(UIAction { [weak self] _ in
            self?.loginButtonPressed()
        }, for: .touchUpInside)
        loginButton.titleLabel?.font = .largeButton
    }
}

// MARK: - Actions
extension LoginView: LoginViewDelegate {
    func loginButtonPressed() {
        delegate?.loginButtonPressed()
    }
}
