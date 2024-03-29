//
//  ProjectSubscriptionAlertViewDelegate.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation

protocol ProjectSubscriptionAlertViewDelegate: AnyObject {
    func closeButtonTapped()
    func primaryButtonTapped()
    func secondaryButtonTapped()
}
