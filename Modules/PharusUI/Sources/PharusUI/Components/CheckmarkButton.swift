//
//  CheckmarkButton.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//

import UIKit

public class CheckmarkButton: UIButton {

    // MARK: - Initializer
    public override init(frame: CGRect) {
        super.init(frame: .zero)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Codable
extension CheckmarkButton: ViewCodable {
    public func setupConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 25),
            self.widthAnchor.constraint(equalToConstant: 25)
        ])
    }

    public func applyAdditionalChanges() {
        self.layer.borderWidth = 1
        self.backgroundColor = .white
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 4
        self.setImage(.pharusIcons.checkmarkIcon, for: .normal)
    }
}
