//
//  LoginViewController.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 28/03/22.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Properties
    private lazy var customView = LoginView()
    private let presenter: LoginPresenting
    var keyboardHeight = CGFloat(0)

    // MARK: - Initializer
    init(presenter: LoginPresenting) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)

        presenter.attach(self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Actions
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (
            notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        )?.cgRectValue {
            if self.customView.frame.origin.y == 0 {
                self.customView.frame.origin.y -= keyboardSize.height + 50
                self.customView.frame.origin.y += keyboardSize.height - 130
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.customView.frame.origin.y != 0 {
            self.customView.frame.origin.y = 0
        }
    }

    private func initializeHideKeyboard() {

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(
                dismissMyKeyboard
            )
        )

        view.addGestureRecognizer(tap)
    }

    @objc private func dismissMyKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - Super Methods
extension LoginViewController {
    override func loadView() {
        self.view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        customView.delegate = self
        initializeHideKeyboard()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
}

// MARK: - Login View Delegate
extension LoginViewController: LoginViewDelegate {
    func loginButtonPressed() {
        guard let email = customView.emailTextField.text else { return }
        guard let password = customView.passwordTextField.text else { return }

        let studentDidLogIn = presenter.loginUser(email: email, password: password)

        if studentDidLogIn == false {
            customView.wrongPasswordImageView.image = customView.wrongPasswordImageView.image?.withTintColor(.redError)
            customView.wrongPasswordLabel.textColor = UIColor.redError
            customView.passwordTextField.textColor = UIColor.redError
        }
    }
}

// MARK: - Login Viewable
extension LoginViewController: LoginViewable { }
