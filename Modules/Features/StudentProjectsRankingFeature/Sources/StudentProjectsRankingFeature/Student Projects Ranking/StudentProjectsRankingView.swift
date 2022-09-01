//
//  StudentProjectsRankingView.swift
//  Pharus
//
//  Created by Victor Colen on 21/06/22.
//

import UIKit
import PharusUI
import CoreKit
import CoreApp

class StudentProjectsRankingView: UIView {

    // MARK: - Properties
    private var projects: [Project]? {
        didSet {
            projects = projects?.filter({ $0.placement != nil })
        }
    }

    // MARK: - Views
    lazy var tableView = UITableView()
        .setting(\.backgroundColor, to: .clear)
        .setting(\.separatorColor, to: .clear)
        .setting(\.allowsSelection, to: false)

    // MARK: - Initializer
    init(projects: [Project]? = nil) {
        self.projects = projects

        super.init(frame: .zero)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Codable
extension StudentProjectsRankingView: ViewCodable {
    func buildHierarchy() {
        addSubview(tableView)
    }

    func setupConstraints() {
        tableView.edges()
    }

    func applyAdditionalChanges() {
        setupTableView()
    }
}

// MARK: - UITableViewDataSource
extension StudentProjectsRankingView: UITableViewDataSource {

    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(
            StudentProjectsRankingCell.self,
            forCellReuseIdentifier: "userRankingProjects"
        )
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        projects?.count ?? 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.cellReuseIdentifiers.userRankingProjects,
            for: indexPath
        ) as? StudentProjectsRankingCell else {

            return tableView.dequeueReusableCell(
                withIdentifier: Constants.cellReuseIdentifiers.userRankingProjects,
                for: indexPath
            )
        }

        if let projects = projects {
            cell.configureCell(using: projects[indexPath.row])
            return cell
        } else {
            cell.configureCell()
            return cell
        }

    }
}

// MARK: - Additional Methods
extension StudentProjectsRankingView {
    func updateView(with projects: [Project]) {
        self.projects = projects
        tableView.reloadData()
    }
}
