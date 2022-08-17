//
//  SecondaryCardButton.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

public class SecondaryCardButton: UIButton {

    // MARK: - Properties
    private var title: String

    // MARK: - Initializer
    public init(title: String) {
        self.title = title

        super.init(frame: .zero)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Codable
extension SecondaryCardButton: ViewCodable {
    public func setupConstraints() {
        self.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }

    public func applyAdditionalChanges() {
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.mediumButtonSemiBold
        setTitleColor(UIColor.Purple.pharusPurple, for: .normal)
        backgroundColor = .clear
        layer.borderWidth = 2
        layer.borderColor = UIColor.Purple.pharusPurple.cgColor
        layer.cornerRadius = 16
    }
}

// MARK: - Additional Methods
extension SecondaryCardButton {
    func disable() {
        self.isEnabled = false
    }

    func enable() {
        self.isEnabled = true
    }
}
