//
//  StudentProjectsRankingViewController.swift
//  Pharus
//
//  Created by Victor Colen on 04/04/22.
//
import UIKit

class StudentProjectsRankingViewController: UIViewController {

    // MARK: - Properties
    private let tableView = StudentProjectsRankingTableView()
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

    // MARK: - Actions
    private func setNavigationBar() {
        self.title = "Seus Rankings"
        self.navigationController?.title = ""
    }

    private func setupTableView() {
        tableView.register(
            StudentProjectRankingCell.self,
            forCellReuseIdentifier: Constants.cellReuseIdentifiers.userRankingProjects
        )

        tableView.stretch(tableView, to: view)
        tableView.dataSource = self
        tableView.allowsSelection = false
    }
}

// MARK: - Super Methods
extension StudentProjectsRankingViewController {
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
}

// MARK: - Student Projects Ranking Viewable
extension StudentProjectsRankingViewController: StudentProjectsRankingViewable { }

// MARK: - Student Projects Ranking View Delegate
extension StudentProjectsRankingViewController: StudentProjectsRankingViewDelegate { }

// MARK: - UITableViewDataSource
extension StudentProjectsRankingViewController: UITableViewDataSource {

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
        return cell
    }
}
