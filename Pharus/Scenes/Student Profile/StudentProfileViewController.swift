//
//  StudentProfileViewController.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 16/04/22.
//

import UIKit

class StudentProfileViewController: UIViewController {

    // MARK: - Properties

    private let studentProfileView: StudentProfileView
    private let presenter: StudentProfilePresenter

    // MARK: - Initializer

    init(
        presenter: StudentProfilePresenter
    ) {
        self.presenter = presenter

        studentProfileView =  StudentProfileView(student: presenter.student)

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

    override func loadView() {
        super.loadView()

        self.view = studentProfileView
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

    // MARK: - Actions

    func showStudentAvatar() {
        studentProfileView.profileImageView.image = UIImage(
            named: "avatar" + presenter.student.avatar + Constants.assets.images.avatar.circleImage.suffix
        )
    }

    func setNavigationBar() {
        self.title = "Perfil"
        self.navigationController?.title = ""

        let logoutIcon = UIImage.pharusIcons.logOutIcon?.withRenderingMode(.alwaysOriginal)
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

// MARK: - Student Profile View Delegate

extension StudentProfileViewController: StudentProfileViewDelegate { }

// MARK: - Student Profile Viewable

extension StudentProfileViewController: StudentProfileViewable { }
