//
//  AppCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 22/03/22.
//

import UIKit

class AppCoordinator: Coordinator {

    // MARK: - Properties
    private let window: UIWindow
    private var rootViewController: UINavigationController

    // MARK: - Initializer
    init(window: UIWindow) {
        self.window = window
        self.rootViewController = UINavigationController()
    }

    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()

        let mainCoordinator = LoginCoordinator(
            navigationController: rootViewController
        )

        mainCoordinator.start()
    }
}
