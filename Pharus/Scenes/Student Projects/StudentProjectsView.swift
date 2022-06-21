//
//  StudentProjectsView.swift
//  Pharus
//
//  Created by Victor Colen on 21/06/22.
//

import UIKit

class StudentProjectsView: UIView {

   private lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectsView.mainView"

        return view
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        tableView.register(
            StudentProjectCell.self,
            forCellReuseIdentifier: Constants.cellReuseIdentifiers.userProjects
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
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

    func customizeSubviews() {

    }

    // MARK: - Constraints
    func setupConstraints() {
        self.stretch(mainView)
        self.stretch(tableView, to: mainView)
    }
}
