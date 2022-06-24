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
    private lazy var studentProjectDetailView = StudentProjectDetailView(
        project: presenter.project
    )

    // MARK: - Initializer
    init(presenter: StudentProjectDetailPresenter) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Super Methods
extension StudentProjectDetailViewController {
    override func loadView() {
        self.view = studentProjectDetailView
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        setGradientBackground()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        studentProjectDetailView.delegate = self
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
