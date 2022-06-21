//
//  StudentAvatar.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 06/04/22.
//

import UIKit

class AvatarSelectionView: UIView {

    // MARK: - Views

    private lazy var mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.accessibilityIdentifier = "StudentAvatarView.scrollView"

        return scrollView
    }()

    private lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentAvatarView.mainView"

        return view
    }()

    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 48
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentAvatarView.avatarStackView"

        return stackView
    }()

    lazy var mainAvatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = FullAvatarImages.avatar1
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "StudentAvatarView.MainAvatarImageView"

        return imageView
    }()

    lazy var avatarSelectionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentAvatarView.avatarSelectionStackView"

        return stackView
    }()

    private lazy var selectYourAvatarLabel: UILabel = {
        let label = UILabel()
        label.text = "Escolha o seu avatar"
        label.textAlignment = .center
        label.font = .largeTitleBold
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentAvatarView.selectYourAvatarLabel"

        return label
    }()

    lazy var collectionViewFlowLayout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20

        return layout
    }()

    lazy var avatarSelectionCollectionView: UICollectionView = {
       let collectionView = UICollectionView(
            frame: mainStackView.frame,
            collectionViewLayout: collectionViewFlowLayout
        )

        collectionView.register(
        UICollectionViewCell.self,
        forCellWithReuseIdentifier: Constants.cellReuseIdentifiers.avatarSelection
    )
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false

        return collectionView
    }()

    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: .zero)

        configureSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Functions

    private func configureSubviews() {
        addSubview(mainScrollView)
        mainScrollView.addSubview(mainView)

        mainView.addSubview(mainStackView)

        mainStackView.addArrangedSubview(mainAvatarImageView)
        mainStackView.addArrangedSubview(avatarSelectionStackView)

        avatarSelectionStackView.addArrangedSubview(selectYourAvatarLabel)
        avatarSelectionStackView.addArrangedSubview(avatarSelectionCollectionView)
    }

    private func setupConstraints() {

        // Main Scroll View
        self.stretch(mainScrollView)

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

        // Main Avatar Image View
        NSLayoutConstraint.activate([
            mainAvatarImageView.heightAnchor.constraint(
                equalToConstant: UIScreen.main.bounds.height/2.2
            )
        ])

        // Select You Avatar Label
        NSLayoutConstraint.activate([
            selectYourAvatarLabel.heightAnchor.constraint(equalToConstant: 25)
        ])

        // Avatar Selection Stack View
        NSLayoutConstraint.activate([
            avatarSelectionCollectionView.heightAnchor.constraint(equalToConstant: 130)
        ])
    }
}
