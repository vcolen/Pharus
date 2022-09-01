//
//  AvatarSelectionViewController.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 06/04/22.
//

import UIKit
import CoreKit

class AvatarSelectionViewController: UIViewController {

    // MARK: - Properties
    private let presenter: AvatarSelectionPresenting
    private lazy var customView = AvatarSelectionView()

    // MARK: - Initializer
    init(presenter: AvatarSelectionPresenting) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)

        presenter.attach(self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Super Methods
extension AvatarSelectionViewController {
    override func loadView() {
        self.view = customView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        customView.delegate = self
        presenter.loadData()
        setGradientBackground()
    }
}

// MARK: - Avatar Selection Viewable
extension AvatarSelectionViewController: AvatarSelectionViewable {
    func updateView(with student: Student) {
        customView.updateView(with: student)
    }
}

// MARK: - Avatar Selection View Delegate
extension AvatarSelectionViewController: AvatarSelectionViewDelegate {
    func avatarImageTapped(avatar: String) {
        presenter.changeStudentAvatar(to: avatar)
    }
}
