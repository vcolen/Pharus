//
//  LoginPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 28/03/22.
//

import Foundation
import InjectionKit
import CoreApp
import CoreKit

class LoginPresenter: BasePresenter<LoginViewable>, LoginPresenting {

    // MARK: - Properties
    private let coordinator: LoginCoordinating
    @Injected var loginUserUseCaseProtocol: LoginUserUseCaseProtocol
    @Injected var setUserTokenUseCaseProtocol: SetUserTokenUseCaseProtocol

    // MARK: - Initializer
    init(coordinator: LoginCoordinating) {
        self.coordinator = coordinator
    }

    // MARK: - Actions
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = Constants.regEx.emailRegEx

        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }

    func isValidPassword(password: String) -> Bool {
        let passwordRegEx = Constants.regEx.passwordRegEx

        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordPredicate.evaluate(with: password)
    }

    func loginUser(email: String, password: String) -> Bool {
        if loginUserUseCaseProtocol(email: email, password: password) {
            setUserTokenUseCaseProtocol()
            coordinator.showHome()
            return true
        }
        return false
    }
}
