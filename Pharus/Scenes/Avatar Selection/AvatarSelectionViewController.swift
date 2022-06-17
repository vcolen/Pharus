//
//  AvatarSelectionViewController.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 06/04/22.
//
import UIKit

class AvatarSelectionViewController: UIViewController {

    // MARK: - Properties

    private var coordinator: AvatarSelectionCoordinator
    private var student: StudentModel
    private var customView: AvatarSelectionView
    private var avatarSelectionCollectionView: UICollectionView?

    // MARK: - Initializer

    init(
        coordinator: AvatarSelectionCoordinator,
        student: StudentModel
    ) {
        self.coordinator = coordinator
        self.student = student
        self.customView = AvatarSelectionView()

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

    override func loadView() {
        super.loadView()

        setupCollectionView()
        self.view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setGradientBackground()
        showStudentAvatar()
    }

    // MARK: - Functions

    private func setNavigationBar() {
        self.title = "Avatar"
        self.navigationController?.title = ""
    }

    private  func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20

        avatarSelectionCollectionView = UICollectionView(
            frame: customView.mainStackView.frame,
            collectionViewLayout: layout
        )

        avatarSelectionCollectionView?.showsHorizontalScrollIndicator = false
        avatarSelectionCollectionView?.register(
            UICollectionViewCell.self,
            forCellWithReuseIdentifier: Constants.cellReuseIdentifiers.avatarSelection
        )

        avatarSelectionCollectionView?.backgroundColor = .clear

        avatarSelectionCollectionView?.dataSource = self
        avatarSelectionCollectionView?.delegate = self

        customView.avatarSelectionStackView.addArrangedSubview(
            avatarSelectionCollectionView ?? UICollectionView()
        )

        NSLayoutConstraint.activate([
            avatarSelectionCollectionView!.heightAnchor.constraint(equalToConstant: 130)
        ])
    }

    private func showStudentAvatar() {
        customView.mainAvatarImageView.image = UIImage(
            named: "avatar" + student.avatar + Constants.assets.images.avatar.fullImage.suffix
        )
    }
}

// MARK: - UI Collection View Data Source
extension AvatarSelectionViewController: UICollectionViewDataSource {
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

extension AvatarSelectionViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let newAvatar = FullAvatarImages.avatars[indexPath.row]
        customView.mainAvatarImageView.image = newAvatar

        student.avatar = String(indexPath.row + 1)
    }
}

// MARK: - Avatar Selection Viewable

extension AvatarSelectionViewController: AvatarSelectionViewable { }

// MARK: - Avatar Selection View Delegate

extension AvatarSelectionViewController: AvatarSelectionViewDelegate { }
