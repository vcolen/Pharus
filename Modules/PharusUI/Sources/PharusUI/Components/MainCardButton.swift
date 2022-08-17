//
//  MainCardButton.swift
//  Pharus
//
//  Created by Victor Colen on 07/04/22.
//

import UIKit

public class MainCardButton: UIButton {

    // MARK: - Properties
    private var title: String
    private var buttonState: State {
        didSet {
            setBackgroundColor()
        }
    }

    // MARK: - Initializer
    public init(title: String, buttonState: State) {
        self.title = title
        self.buttonState = buttonState

        super.init(frame: .zero)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Codable
extension MainCardButton: ViewCodable {
    public func setupConstraints() {
        self.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }

    public func applyAdditionalChanges() {
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.mediumButtonSemiBold
        setTitleColor(UIColor.Project.grayDisabledText, for: .disabled)
        setTitleColor(UIColor.Button.whiteMainButtonText, for: .normal)
        setBackgroundColor()
        layer.cornerRadius = 16
    }
}

// MARK: - Additional Methods
extension MainCardButton {
    private func setBackgroundColor() {
        if buttonState == .normal {
            backgroundColor = UIColor.Purple.pharusPurple
        } else {
            backgroundColor = UIColor.Button.grayDisabledBackground
        }
    }

    public func disable() {
        self.isEnabled = false
        self.buttonState = .disabled
    }

    public func enable() {
        self.isEnabled = true
        self.buttonState = .normal
    }
}
