//
//  UploadMessageButton.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 19/04/22.
//

import UIKit

class UploadMessageButton: UIButton {

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

    // MARK: - Actions
    func disable() {
        self.isEnabled = false
        self.buttonState = .disabled
    }

    func enable() {
        self.isEnabled = true
        self.buttonState = .normal
    }

    private func configureSubviews() {
        setTitle(title, for: .normal)
        setBackgroundColor()
        setTitleColor(UIColor.Project.grayDisabledText, for: .disabled)
        setTitleColor(UIColor.Button.whiteMainButtonText, for: .normal)
        layer.cornerRadius = 16
    }

    func setBackgroundColor() {
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
}
