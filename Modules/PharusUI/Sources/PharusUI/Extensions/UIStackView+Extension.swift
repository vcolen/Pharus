//
//  UIStackView+Extension.swift
//  Pharus
//
//  Created by Victor Colen on 18/04/22.
//
import UIKit

public extension UIStackView {

    convenience init(_ views: [UIView]) {
        self.init(frame: .zero)
        for view in views {
            addArrangedSubview(view)
        }
    }

    func removeFully(view: UIView) {
        removeArrangedSubview(view)
        view.removeFromSuperview()
    }

    func removeFullyAllArrangedSubviews() {
        arrangedSubviews.forEach { (view) in
            removeFully(view: view)
        }
    }
}
