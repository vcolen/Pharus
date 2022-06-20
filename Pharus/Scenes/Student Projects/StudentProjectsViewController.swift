//
//  UserProjectsViewController.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import UIKit

class StudentProjectsViewController: UIViewController {

    // MARK: - Properties

    private var presenter: StudentProjectsPresenter
    private var projects: [ProjectModel]
    private let tableView = UITableView()

    // MARK: - Initializer

    init(presenter: StudentProjectsPresenter) {
        self.presenter = presenter
        self.projects = presenter.student.projects

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

    override func loadView() {
        super.loadView()

        view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        view.addSubview(tableView)
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        setGradientBackground()
    }

    // MARK: - Actions

    private func setNavigationBar() {
        self.title = "Seus projetos"
        self.navigationController?.title = ""
    }

    private func setupTableView() {
        tableView.register(StudentProjectCell.self,
                           forCellReuseIdentifier: Constants.cellReuseIdentifiers.userProjects)

        tableView.dataSource = self
        tableView.delegate = self

        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Student Projects View Delegate

extension StudentProjectsViewController: StudentProjectsViewDelegate { }

// MARK: - Student Projects Viewable

extension StudentProjectsViewController: StudentProjectsViewable { }

// MARK: - UITableViewDataSource

extension StudentProjectsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        397
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        projects.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.cellReuseIdentifiers.userProjects,
            for: indexPath
        ) as? StudentProjectCell else {
            return tableView.dequeueReusableCell(
                withIdentifier: Constants.cellReuseIdentifiers.userProjects,
                for: indexPath
            )
        }

        let project = projects[indexPath.row]

        cell.configureSubviews()
        cell.setupConstraints()
        cell.configureCell(using: project)
        if project.isSubscribed == false {
            cell.subscribeButton.addAction( UIAction { _ in
                self.presenter.showSubscribeAlert(of: project)
            }, for: .touchUpInside)
        }
        cell.mainView.layer.cornerRadius = 16
        cell.backgroundColor = .clear

        return cell
    }
}

// MARK: - UITableViewDelegate

extension StudentProjectsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let project = projects[indexPath.row]
        presenter.showStudentProject(project: project)

        tableView.deselectRow(at: indexPath, animated: true)
    }
}
