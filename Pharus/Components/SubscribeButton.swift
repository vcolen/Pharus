//
//  SubscribeButton.swift
//  Pharus
//
//  Created by Victor Colen on 17/04/22.
//

import UIKit

class SubscribeButton: UIButton {

    // MARK: - Properties
    var isSubscribed: Bool {
        didSet {
            self.setButtonColors()
        }
    }

    // MARK: - Initializer
    init(isSubscribed: Bool) {
        self.isSubscribed = isSubscribed

        super.init(frame: .zero)

        configureSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews
    private func configureSubviews() {
        setButtonColors()
        titleLabel?.font = UIFont.smallButtonSemiBold
        backgroundColor = .clear
        contentEdgeInsets = UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 16.0)
        layer.borderWidth = 2
        layer.cornerRadius = 16
    }

    private func setButtonColors() {
        if isSubscribed {
            setTitle("Inscrito", for: .normal)
            setTitleColor(UIColor.Button.graySubscribeText, for: .normal)
            layer.borderColor = UIColor.Button.graySubscribeBorder.cgColor
        } else {
            setTitle("Inscreva-se", for: .normal)
            setTitleColor(UIColor.Purple.pharusPurple, for: .normal)
            layer.borderColor = UIColor.Purple.pharusPurple.cgColor
        }
    }

    // MARK: - Constraints
    private func setupConstraints() {
        self.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
}
