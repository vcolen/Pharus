//
//  UserProjectsViewController.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import UIKit

class StudentProjectsViewController: UIViewController {

    // MARK: - Properties
    private let presenter: StudentProjectsPresenter
    private lazy var customView = StudentProjectsView(student: presenter.student)

    // MARK: - Initializer
    init(presenter: StudentProjectsPresenter) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Actions
    private func setNavigationBar() {
        self.title = "Seus projetos"
        self.navigationController?.title = ""
    }
}

// MARK: - Super Mehods
extension StudentProjectsViewController {
    override func loadView() {
        super.loadView()

        view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view = customView
        setNavigationBar()
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
    func subscribeButtonTapped(of project: ProjectModel) {
        presenter.showSubscribeAlert(of: project)
    }

    func projectCellTapped(for project: ProjectModel) {
        presenter.showStudentProject(project: project)
    }
}

// MARK: - Student Projects Viewable
extension StudentProjectsViewController: StudentProjectsViewable { }
