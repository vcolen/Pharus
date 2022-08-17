//
//  StudentProjectsViewController.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import UIKit

class StudentProjectsViewController: UIViewController {

    // MARK: - Properties
    private let presenter: StudentProjectsPresenting
    private lazy var customView = StudentProjectsView(student: presenter.student)

    // MARK: - Initializer
    init(presenter: StudentProjectsPresenting) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)

        presenter.attach(self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Super Mehods
extension StudentProjectsViewController {
    override func loadView() {
        self.view = customView
        self.view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        customView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        customView.tableView.reloadData()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        setGradientBackground()
    }
}

// MARK: - Student Projects View Delegate
extension StudentProjectsViewController: StudentProjectsViewDelegate {
    func subscribeButtonTapped(of project: ProjectModel, at index: Int) {
        presenter.showSubscribeAlert(of: project, at: index)
    }

    func projectCellTapped(for project: ProjectModel) {
        presenter.showStudentProject(project: project)
    }
}

// MARK: - Student Projects Viewable
extension StudentProjectsViewController: StudentProjectsViewable { }
