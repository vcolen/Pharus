//
//  StudentProjectsView.swift
//  Pharus
//
//  Created by Victor Colen on 21/06/22.
//

import UIKit
import PharusUI
import CoreApp

class StudentProjectsView: UIView {

    // MARK: - Properties
    weak var delegate: StudentProjectsViewDelegate?
    private let student: Student

    // MARK: - Views
    lazy var tableView = UITableView()
        .setting(\.backgroundColor, to: .clear)
        .setting(\.separatorColor, to: .clear)

    // MARK: - Initializer
    init(student: Student) {
        self.student = student

        super.init(frame: .zero)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
}

// MARK: - View Codable
extension StudentProjectsView: ViewCodable {
    func buildHierarchy() {
        addSubview(tableView)
    }

    func setupConstraints() {
        tableView.edges()
    }

    func applyAdditionalChanges() {
        tableView.register(
            StudentProjectCell.self,
            forCellReuseIdentifier: Constants.cellReuseIdentifiers.userProjects
        )

        setupTableViewDelegate()
    }
}

// MARK: - UITableViewDataSource
extension StudentProjectsView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        397
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        student.projects.count
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

        let project = student.projects[indexPath.row]

        cell.setupView()
        cell.configureCell(using: project)

        if project.isSubscribed == false {
            cell.subscribeButton.originalView.addAction( UIAction { [weak self] _ in
                self?.delegate?.subscribeButtonTapped(of: project, at: indexPath.row)
            }, for: .touchUpInside)
        }

        return cell
    }
}

// MARK: - UITableViewDelegate
extension StudentProjectsView: UITableViewDelegate {

    private func setupTableViewDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let project = student.projects[indexPath.row]
        delegate?.projectCellTapped(for: project)

        tableView.deselectRow(at: indexPath, animated: true)
    }
}
