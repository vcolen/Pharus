//
//  UploadMessageButton.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 19/04/22.
//

import UIKit

public class UploadMessageButton: UIButton {

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
extension UploadMessageButton: ViewCodable {
    public func setupConstraints() {
        self.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }

    public func applyAdditionalChanges() {
        setTitle(title, for: .normal)
        setBackgroundColor()
        setTitleColor(UIColor.Project.grayDisabledText, for: .disabled)
        setTitleColor(UIColor.Button.whiteMainButtonText, for: .normal)
        layer.cornerRadius = 16
    }
}

// MARK: - Additional Methods
extension UploadMessageButton {
    func setBackgroundColor() {
        if buttonState == .normal {
            backgroundColor = UIColor.Purple.pharusPurple
        } else {
            backgroundColor = UIColor.Button.grayDisabledBackground
        }
    }

    func disable() {
        self.isEnabled = false
        self.buttonState = .disabled
    }

    func enable() {
        self.isEnabled = true
        self.buttonState = .normal
    }
}
