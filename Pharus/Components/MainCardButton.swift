//
//  MainCardButton.swift
//  Pharus
//
//  Created by Victor Colen on 07/04/22.
//

import UIKit

class MainCardButton: UIButton {

    // MARK: - Properties
    private var title: String
    private var buttonState: State {
        didSet {
            setBackgroundColor()
        }
    }

    // MARK: - Initializer
    init(title: String, buttonState: State) {
        self.title = title
        self.buttonState = buttonState

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
        setBackgroundColor()
        setTitleColor(UIColor.Project.grayDisabledText, for: .disabled)
        setTitleColor(UIColor.Button.whiteMainButtonText, for: .normal)
        layer.cornerRadius = 16
    }

    private func setBackgroundColor() {
        if buttonState == .normal {
            backgroundColor = UIColor.Purple.pharusPurple
        } else {
            backgroundColor = UIColor.Button.grayDisabledBackground
        }
    }

    // MARK: - Constraints
    private func setupConstraints() {
        self.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }

    // MARK: - Actions
    func disable() {
        self.isEnabled = false
        self.buttonState = .disabled
    }

    func enable() {
        self.isEnabled = true
        self.buttonState = .normal
    }
}
