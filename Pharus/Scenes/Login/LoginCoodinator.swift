//
//  LoginCoodinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 28/03/22.
//

import UIKit

protocol LoginFlow {
    func showHome(student: Student)
}

class LoginCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginPresenter = LoginPresenter(coordinator: self)
        let loginViewController = LoginViewController(
            coordinator: self,
            presenter: loginPresenter
        )
    
        navigationController.setNavigationBarHidden(true, animated: true)
        navigationController.tabBarController?.tabBar.isHidden = true
        
        navigationController.pushViewController(loginViewController, animated: true)
    }
}

extension LoginCoordinator: LoginFlow {
    func showHome(student: Student) {
        //Implementar tabbar
//        let studentProjectsCoordinator = StudentProjectsCoordinator(navigationController: navigationController, student: student)
//
//        self.coordinate(to: studentProjectsCoordinator)
        
        let studentHomeCoordinator = StudentHomeCoordinator(
            navigationController: navigationController
        )
        
        coordinate(to: studentHomeCoordinator)
    }
}
