//
//  AvatarSelectionView.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 06/04/22.
//

import UIKit
import PharusUI

class AvatarSelectionView: UIView {

    // MARK: - Properties
    weak var delegate: AvatarSelectionViewDelegate?
    private var student: StudentModel

    // MARK: - Views
    private lazy var mainScrollView = ScrollView {
        mainStackView
    }

    private lazy var mainStackView = VStackView([
        mainAvatarImageView,
        avatarSelectionStackView
    ])
        .setting(\.spacing, to: 48)
        .padding([.top], 30)

    private lazy var mainAvatarImageView = UIImageView()
        .setting(\.image, to: FullAvatarImages.avatar1)
        .setting(\.contentMode, to: .scaleAspectFit)
        .frame(height: UIScreen.main.bounds.height/2.2)

    private lazy var avatarSelectionStackView = VStackView([
        selectYourAvatarLabel
    ])
        .setting(\.spacing, to: 32)

    private lazy var selectYourAvatarLabel = UILabel()
        .setting(\.text, to: "Escolha o seu avatar")
        .setting(\.textAlignment, to: .center)
        .setting(\.font, to: .largeTitleBold)
        .setting(\.textColor, to: .white)
        .frame(height: 25)

    private lazy var collectionViewFlowLayout = UICollectionViewFlowLayout()
        .setting(\.scrollDirection, to: .horizontal)
        .setting(\.sectionInset, to: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        .setting(\.itemSize, to: CGSize(width: 120, height: 120))
        .setting(\.minimumLineSpacing, to: 20)
        .setting(\.minimumInteritemSpacing, to: 20)

    private lazy var avatarSelectionCollectionView = UICollectionView(
        frame: mainStackView.frame,
        collectionViewLayout: collectionViewFlowLayout
    )
        .setting(\.backgroundColor, to: .clear)
        .setting(\.showsHorizontalScrollIndicator, to: false)
        .frame(height: 130)

    // MARK: - Initializer
    init(student: StudentModel) {
        self.student = student

        super.init(frame: .zero)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Codable
extension AvatarSelectionView: ViewCodable {
     func buildHierarchy() {
        addSubview(mainScrollView)
         avatarSelectionStackView.addArrangedSubview(avatarSelectionCollectionView)
    }

     func setupConstraints() {
         mainScrollView.edges()
    }

    func applyAdditionalChanges() {
        showStudentAvatar()
        setupCollectionViewDelegate()
    }
}

// MARK: - UI Collection View Data Source
extension AvatarSelectionView: UICollectionViewDataSource {
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        CircleAvatarImages.avatars.count
    }

     func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.cellReuseIdentifiers.avatarSelection,
            for: indexPath
        )

        let avatarImage = CircleAvatarImages.avatars[indexPath.row]
        let avatarImageView = UIImageView(image: avatarImage)

        cell.addSubview(avatarImageView)
        return cell
    }
}

// MARK: - UI Collection View Delegate
extension AvatarSelectionView: UICollectionViewDelegate {
     func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        let newAvatar = FullAvatarImages.avatars[indexPath.row]
        mainAvatarImageView.image = newAvatar

        delegate?.avatarImageTapped(avatar: String(indexPath.row + 1))
    }
}

// MARK: - Additional Methods
extension AvatarSelectionView {
    private func showStudentAvatar() {
        mainAvatarImageView.image = UIImage(
            named: "avatar" + student.avatar + PharusUIConstants.assets.images.avatar.fullImage.suffix
        )
    }

    private func setupCollectionViewDelegate() {
        avatarSelectionCollectionView.register(
            UICollectionViewCell.self,
            forCellWithReuseIdentifier: Constants.cellReuseIdentifiers.avatarSelection
        )
        avatarSelectionCollectionView.dataSource = self
        avatarSelectionCollectionView.delegate = self
    }
}
