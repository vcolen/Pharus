//
//  AvatarSelectionViewController.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 06/04/22.
//
import UIKit

class AvatarSelectionViewController: UIViewController {

    // MARK: - Properties
    private let presenter: AvatarSelectionPresenter
    private lazy var customView = AvatarSelectionView(student: presenter.student)

    // MARK: - Initializer
    init(presenter: AvatarSelectionPresenter) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Functions
    private func setNavigationBar() {
        self.title = "Avatar"
        self.navigationController?.title = ""
    }
}

// MARK: - Super Methods
extension AvatarSelectionViewController {
    override func loadView() {
        super.loadView()

        self.view = customView
        customView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setGradientBackground()
    }
}

// MARK: - Avatar Selection Viewable
extension AvatarSelectionViewController: AvatarSelectionViewable { }

// MARK: - Avatar Selection View Delegate
extension AvatarSelectionViewController: AvatarSelectionViewDelegate {
    func avatarImageTapped(avatar: String) {
        presenter.changeStudentAvatar(to: avatar)
    }
}
