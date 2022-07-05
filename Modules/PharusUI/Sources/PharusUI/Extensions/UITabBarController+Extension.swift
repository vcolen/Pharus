//
//  UITabBarController+Extension.swift
//  Pharus
//
//  Created by Victor Colen on 29/06/22.
//

import UIKit

public extension UITabBarController {
    func addViewController(_ viewController: UIViewController) {
        if self.viewControllers == nil {
            self.setViewControllers([viewController], animated: false)
        } else {
            self.viewControllers?.append(viewController)
        }
    }
}
