//
//  AvatarSelectionCell.swift
//  Pharus
//
//  Created by Victor Colen on 25/07/22.
//

import UIKit
import PharusUI

class AvatarSelectionCell: UICollectionViewCell {

    // MARK: - Views
    lazy var avatarImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Codable
extension AvatarSelectionCell: ViewCodable {
    func buildHierarchy() {
        addSubview(avatarImageView)
    }

    func setupConstraints() {
        avatarImageView.edges()
    }
}
