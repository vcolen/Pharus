//
//  ZStackView.swift
//
//
//  Created by Victor Colen on 28/07/22.
//

import UIKit

public class ZStackView: UIView {

    public init(_ views: [UIView]) {
        super.init(frame: .zero)

        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
            view.edges()
        }
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Additional Methods
extension ZStackView {
    public func addArrangedSubview(_ view: UIView) {
        addSubview(view.center(.allAxis))
    }
}
