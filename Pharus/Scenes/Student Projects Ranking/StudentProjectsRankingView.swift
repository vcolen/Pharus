//
//  StudentProjectsRankingView.swift
//  Pharus
//
//  Created by Victor Colen on 21/06/22.
//

import UIKit

class StudentProjectsRankingView: UIView {

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
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.accessibilityIdentifier = "StudentProjectsRankingView.tableView"

        return tableView
    }()

    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: .zero)

        configureSubviews()
        setupConstraints()
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
