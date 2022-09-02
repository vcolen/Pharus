//
//  StudentProjectDetailViewController.swift
//  Pharus
//
//  Created by Victor Colen on 05/04/22.
//

import UIKit
import PharusUI
import CoreKit

class StudentProjectDetailViewController: UIViewController {

    // MARK: - Properties
    private let presenter: StudentProjectDetailPresenting
    private lazy var customView = StudentProjectDetailView()

    // MARK: - Initializer
    init(presenter: StudentProjectDetailPresenter) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)

        presenter.attach(self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Super Methods
extension StudentProjectDetailViewController {
    override func loadView() {
        self.view = customView
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        setGradientBackground()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabbar()
        customView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        presenter.loadData()
    }
}

// MARK: - Student Project Detail View Delegate
extension StudentProjectDetailViewController: StudentProjectDetailViewDelegate {
    func envelopeIconTapped() {
        presenter.showMentorReview()
    }

    func taskCheckboxTapped(taskId: Int) {
        presenter.toggleTaskCompletedStatus(taskId: taskId)
        presenter.loadData()
    }

    func rulesViewTapped() {
        presenter.showProjectRules()
    }

    func uploadFilesButtonTapped() {
        presenter.showUploadFileView()
    }
}

// MARK: - Student Project Detail Viewable
extension StudentProjectDetailViewController: StudentProjectDetailViewable {
    func updateView(with project: Project) {
        customView.updateView(with: project)
    }
}

// MARK: - Methods
extension StudentProjectDetailViewController {
    func setupTabbar() {
        var backButtonImage = UIImage(named: PharusUIConstants.assets.icons.backArrowIcon)
        backButtonImage = backButtonImage?.withTintColor(
            .white,
            renderingMode: .alwaysOriginal
        )

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: backButtonImage,
            style: .plain,
            target: self,
            action: #selector(backButtonPressed))
    }

    @objc func backButtonPressed() {
        self.navigationController?.popViewController(animated: true)
      }
}
