//
//  StudentProfileViewController.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 16/04/22.
//

import UIKit
import CoreKit

class StudentProfileViewController: UIViewController {

    // MARK: - Properties
    private let presenter: StudentProfilePresenting
    private lazy var customView = StudentProfileView()

    // MARK: - Initializer
    init(presenter: StudentProfilePresenting) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)

        presenter.attach(self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Actions
    func setNavigationBar() {
        let logoutIcon = UIImage.pharusIcons.logoutIcon?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: logoutIcon,
            style: .plain,
            target: self,
            action: #selector(logoutTapped)
        )
    }

    @objc func logoutTapped() {
        presenter.showLogoutAlert()
    }
}

// MARK: - Super Methods
extension StudentProfileViewController {
    override func loadView() {
        self.view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setGradientBackground()
        presenter.loadData()
    }
}

// MARK: - Student Profile View Delegate
extension StudentProfileViewController: StudentProfileViewDelegate { }

// MARK: - Student Profile Viewable
extension StudentProfileViewController: StudentProfileViewable {
    func updateView(with student: Student) {
        customView.updateView(with: student)
    }
}
