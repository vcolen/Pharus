//
//  UserProfileButton.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//

import UIKit

class StudentProfileButton: UIButton {

    // MARK: - Properties
    private var userImage: UIImage

    // MARK: - Initializer
    init(userImage: UIImage) {
        self.userImage = userImage

        super.init(frame: .zero)

        configureSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews
    private func configureSubviews() {
        self.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
        self.clipsToBounds = true
        self.setImage(userImage, for: .normal)
    }
}
