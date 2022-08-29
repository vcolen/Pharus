//
//  StudentProjectsRankingView.swift
//  Pharus
//
//  Created by Victor Colen on 21/06/22.
//

import UIKit
import PharusUI
import CoreApp

class StudentProjectsRankingView: UIView {

    // MARK: - Properties
    private let student: StudentModel
    private let projects: [ProjectModel]

    // MARK: - Views
    lazy var tableView = UITableView()
        .setting(\.backgroundColor, to: .clear)
        .setting(\.separatorColor, to: .clear)
        .setting(\.allowsSelection, to: false)

    // MARK: - Initializer
    init(student: StudentModel) {
        self.student = student
        self.projects = student.projects.filter({ $0.placement != nil })

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
        projects.count
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

        cell.configureCell(using: projects[indexPath.row])
        return cell
    }
}
