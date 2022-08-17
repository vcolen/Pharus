//
//  UserProfileButton.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//

import UIKit

public class StudentProfileButton: UIButton {

    // MARK: - Properties
    private var userImage: UIImage

    // MARK: - Initializer
    public init(userImage: UIImage) {
        self.userImage = userImage

        super.init(frame: .zero)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Codable
extension StudentProfileButton: ViewCodable {
    public func applyAdditionalChanges() {
        self.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
        self.clipsToBounds = true
        self.setImage(userImage, for: .normal)
    }
}
