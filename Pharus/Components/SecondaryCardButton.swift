//
//  SecondaryCardButton.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

class SecondaryCardButton: UIButton {

    // MARK: - Properties
    private var title: String

    // MARK: - Initializer
    init(title: String) {
        self.title = title

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
        titleLabel?.font = UIFont.mediumButtonSemiBold
        setTitleColor(UIColor.Purple.pharusPurple, for: .normal)
        backgroundColor = .clear
        layer.borderWidth = 2
        layer.borderColor = UIColor.Purple.pharusPurple.cgColor
        layer.cornerRadius = 16
    }

    // MARK: - Constraints
    private func setupConstraints() {
        self.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }

    // MARK: - Actions
    func disable() {
        self.isEnabled = false
    }

    func enable() {
        self.isEnabled = true
    }
}
