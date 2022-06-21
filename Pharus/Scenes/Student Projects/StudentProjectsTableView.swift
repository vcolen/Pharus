//
//  StudentProjectsTableView.swift
//  Pharus
//
//  Created by Victor Colen on 21/06/22.
//

import UIKit

class StudentProjectsTableView: UITableView {

    // MARK: - Initializer
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .plain)

        configureSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }

    // MARK: - Subviews
    func configureSubviews() {
        self.backgroundColor = .clear
        self.separatorColor = .clear
    }

    func customizeSubviews() {

    }

    // MARK: - Constraints
    func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.stretch(self)
    }
}
