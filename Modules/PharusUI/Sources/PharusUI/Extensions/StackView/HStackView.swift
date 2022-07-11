//
//  HStackView.swift
//
//
//  Created by Victor Colen on 11/07/22.
//

import UIKit

public class HStackView: UIStackView {

    public init(
        spacing: CGFloat = 0,
        _ views: [UIView]
    ) {
        super.init(frame: .zero)
        self.spacing = spacing
        self.axis = .horizontal
        for view in views {
            addArrangedSubview(view)
        }
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
