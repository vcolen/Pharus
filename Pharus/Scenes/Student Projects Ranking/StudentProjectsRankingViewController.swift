//
//  StudentRankingProjectsViewController.swift
//  Pharus
//
//  Created by Victor Colen on 04/04/22.
//
import UIKit

class StudentRankingProjectsViewController: UIViewController {

    // MARK: - Properties

    private let tableView = UITableView()
    private let presenter: StudentProjectsRankingPresenter
    private let projects: [ProjectModel]

    // MARK: - Initializer

    init(presenter: StudentProjectsRankingPresenter) {
        self.presenter = presenter
        self.projects = presenter.student.projects.filter({ $0.placement != nil })

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

    override func loadView() {
        super.loadView()

        tableView.backgroundColor = .clear
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()

        view.addSubview(tableView)
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setGradientBackground()
    }

    // MARK: - Actions

    private func setNavigationBar() {
        self.title = "Seus Rankings"
        self.navigationController?.title = ""
    }

    private func setupTableView() {
        tableView.register(StudentProjectRankingCell.self,
                           forCellReuseIdentifier: Constants.cellReuseIdentifiers.userRankingProjects)

        tableView.dataSource = self
        tableView.allowsSelection = false

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

// MARK: - Student Projects Ranking Viewable

extension StudentRankingProjectsViewController: StudentProjectsRankingViewable { }

// MARK: - Student Projects Ranking View Delegate

extension StudentRankingProjectsViewController: StudentProjectsRankingViewDelegate { }

// MARK: - UITableViewDataSource

extension StudentRankingProjectsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        projects.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.cellReuseIdentifiers.userRankingProjects,
            for: indexPath
        ) as? StudentProjectRankingCell else {
            return tableView.dequeueReusableCell(
                withIdentifier: Constants.cellReuseIdentifiers.userRankingProjects,
                for: indexPath
            )
        }

        let project = projects[indexPath.row]
        cell.configureCell(using: project)
        cell.mainView.layer.cornerRadius = 16
        cell.backgroundColor = .clear

        return cell
    }
}
