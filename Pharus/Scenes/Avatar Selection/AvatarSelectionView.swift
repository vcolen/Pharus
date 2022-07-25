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
        mainView
    }

    private lazy var mainView = UIView()

    lazy var mainStackView = VStackView([

    ])
        .setting(\.spacing, to: 48)
        .setting(\.translatesAutoresizingMaskIntoConstraints, to: false)

    lazy var mainAvatarImageView = UIImageView()
        .setting(\.image, to: FullAvatarImages.avatar1)
        .setting(\.contentMode, to: .scaleAspectFit)
        .frame(height: UIScreen.main.bounds.height/2.2)

    lazy var avatarSelectionStackView = VStackView([

    ])
        .setting(\.spacing, to: 32)

    private lazy var selectYourAvatarLabel = UILabel()
        .setting(\.text, to: "Escolha o seu avatar")
        .setting(\.textAlignment, to: .center)
        .setting(\.font, to: .largeTitleBold)
        .setting(\.textColor, to: .white)
        .frame(height: 25)

    lazy var collectionViewFlowLayout = UICollectionViewFlowLayout()
        .setting(\.scrollDirection, to: .horizontal)
        .setting(\.sectionInset, to: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        .setting(\.itemSize, to: CGSize(width: 120, height: 120))
        .setting(\.minimumLineSpacing, to: 20)
        .setting(\.minimumInteritemSpacing, to: 20)

    lazy var avatarSelectionCollectionView = UICollectionView(
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
        mainView.addSubview(mainStackView)

        mainStackView.addArrangedSubview(mainAvatarImageView)
        mainStackView.addArrangedSubview(avatarSelectionStackView)

        avatarSelectionStackView.addArrangedSubview(selectYourAvatarLabel)
        avatarSelectionStackView.addArrangedSubview(avatarSelectionCollectionView)
    }

     func setupConstraints() {
         mainScrollView.edges()

        // Main View
        self.stretch(mainView, to: mainScrollView)
        mainView.center(in: mainScrollView)
        NSLayoutConstraint.activate([
            mainView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])

        // Main Stack View
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20)
        ])
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
    func showStudentAvatar() {
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
