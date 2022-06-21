//
//  StudentProjectDetailViewController.swift
//  Pharus
//
//  Created by Victor Colen on 05/04/22.
//
import UIKit

class StudentProjectDetailViewController: UIViewController {

    // MARK: - Properties
    private let presenter: StudentProjectDetailPresenter
    private let studentProjectDetailView: StudentProjectDetailView

    // MARK: - Initializer
    init(presenter: StudentProjectDetailPresenter) {
        self.presenter = presenter
        self.studentProjectDetailView = StudentProjectDetailView(project: presenter.project)

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Actions
    func setNavigationBar() {
        self.title = presenter.project.name

        var backButtonImage = UIImage(named: Constants.assets.icons.backArrowIcon)
        backButtonImage = backButtonImage?.withTintColor(
            .white,
            renderingMode: .alwaysOriginal
        )

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: backButtonImage,
            style: .plain,
            target: self,
            action: #selector(backButtonPressed)
        )

    }

    @objc func backButtonPressed() {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Super Methods
extension StudentProjectDetailViewController {
    override func loadView() {
        super.loadView()

        studentProjectDetailView.delegate = self
        self.view = studentProjectDetailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        setGradientBackground()
    }
}

// MARK: - Student Project Detail View Delegate
extension StudentProjectDetailViewController: StudentProjectDetailViewDelegate {
    func envelopeIconTapped() {
        presenter.showMentorReview()
    }

    func taskCheckboxTapped(task: TaskModel) {
        presenter.toggleTaskCompletedStatus(task: task)
    }

    func rulesViewTapped() {
        presenter.showProjectRules()
    }

    func sendFilesButtonTapped() {
        presenter.showUploadFileView()
    }
}

// MARK: - Student Project Detail Viewable
extension SendFileViewController: StudentProjectsViewable { }
