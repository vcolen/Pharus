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

    // MARK: - Initializer
    init(coordinator: LoginCoordinating) {
        self.coordinator = coordinator
    }

    // MARK: - Actions
    func isValidEmail(email: String) -> Bool {
        #warning("Trocar por constante")
        let emailRegEx = "^[a-z0-9_%+-]+([.-][a-z0-9]+)*@[a-z0-9]+([.-][a-z0-9]+)*\\.[a-z]{2,3}$"

        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }

    func isValidPassword(password: String) -> Bool {
        #warning("Trocar por constante")
        let passwordRegEx = "^(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"

        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordPredicate.evaluate(with: password)
    }

    func loginUser(email: String, password: String) -> Bool {
        if loginUserUseCaseProtocol(email: email, password: password) {
            coordinator.showHome()
            return true
        }
        return false
    }
}
