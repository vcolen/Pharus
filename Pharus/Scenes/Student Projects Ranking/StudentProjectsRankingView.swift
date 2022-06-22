//
//  StudentProjectsRankingView.swift
//  Pharus
//
//  Created by Victor Colen on 21/06/22.
//

import UIKit

class StudentProjectsRankingView: UIView {

    // MARK: - Properties
    private let student: StudentModel
    private let projects: [ProjectModel]

    // MARK: - Views
    lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectsRankingView.mainView"

        return view
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        tableView.register(
            StudentProjectRankingCell.self,
            forCellReuseIdentifier: Constants.cellReuseIdentifiers.userRankingProjects
        )
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.accessibilityIdentifier = "StudentProjectsRankingView.tableView"

        return tableView
    }()

    // MARK: - Initializer
    init(student: StudentModel) {
        self.student = student
        self.projects = student.projects.filter({ $0.placement != nil })

        super.init(frame: .zero)

        configureSubviews()
        setupConstraints()
        setupTableViewDataSource()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews
    func configureSubviews() {
        addSubview(mainView)
        mainView.addSubview(tableView)
    }

    func setupConstraints() {
        // Main View
        self.stretch(mainView)

        // Table View
        self.stretch(tableView, to: mainView)
    }
}

// MARK: - UITableViewDataSource
extension StudentProjectsRankingView: UITableViewDataSource {

    private func setupTableViewDataSource() {
        tableView.dataSource = self
    }

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
