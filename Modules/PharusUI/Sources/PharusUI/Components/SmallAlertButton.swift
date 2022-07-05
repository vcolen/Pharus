//
//  SmallAlertButton.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

public class SmallAlertButton: UIButton {

    // MARK: - Properties
    private var title: String
    private var importance: Importance

    public enum Importance {
        case primary
        case secondary
    }

    // MARK: - Initializer
    public init(
        title: String,
        importance: Importance
    ) {
        self.title = title
        self.importance = importance

        super.init(frame: .zero)

        configureSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews
    private func configureSubviews() {
        setTitle(title, for: .normal)
        layer.borderWidth = 2
        layer.borderColor = UIColor.Purple.pharusPurple.cgColor
        layer.cornerRadius = 16

        if importance == .primary {
            backgroundColor = UIColor.Purple.pharusPurple
            setTitleColor(.white, for: .normal)
        } else {
            backgroundColor = .clear
            setTitleColor(UIColor.Purple.pharusPurple, for: .normal)
        }
    }

    // MARK: - Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
}
