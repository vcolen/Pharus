//
//  UploadMessageButton.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 19/04/22.
//

import UIKit

class UploadMessageButton: UIButton {
    
    //MARK: - Properties
    
    private var title: String
    private var buttonState: State {
        didSet {
            setBackgroundColor()
        }
    }
    
    
    //MARK: - Initializer
    
    convenience init(title: String, buttonState: State) {
        self.init()
        
        self.title = title
        self.buttonState = buttonState
        
        configureSubviews()
        setupConstraints()
    }
    
    override init(frame: CGRect) {
        self.title = "Fechar"
        self.buttonState = .normal
        
        super.init(frame: .zero)
        
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        setTitleColor(UIColor.project.grayDisabledText, for: .disabled)
        setTitleColor(UIColor.button.whiteMainButtonText, for: .normal)
        layer.cornerRadius = 16
    }
    
    func setBackgroundColor() {
        if buttonState == .normal {
            backgroundColor = UIColor.purple.pharusPurple
        } else {
            backgroundColor = UIColor.button.grayDisabledBackground
        }
    }
    
    //MARK: - Constraints
    
    private func setupConstraints() {
        self.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
}
