//
//  ProjectTaskView.swift
//  Pharus
//
//  Created by Victor Colen on 11/04/22.
//

import UIKit
import PharusUI
import CoreKit

class ProjectTaskView: UIView {

    // MARK: - Properties
    private var task: Task?
    private var checkImage: UIImage?
    var color: UIColor

    // MARK: - Views
    private lazy var mainStackView = HStackView([
        taskCheckmarkButton,
        taskTitleLabel
    ])
    .setting(\.spacing, to: 11)

    private lazy var taskTitleLabel = UILabel()
        .setting(\.font, to: .mediumTitleMedium)
        .setting(\.numberOfLines, to: 0)
        .setting(\.text, to: "Lorem ipsum")
        .setting(\.textColor, to: color)

    lazy var taskCheckmarkButton = CheckmarkButton()
        .frame(width: 25, height: 25)

    // MARK: - Initializer
    init(
        task: Task? = nil,
        checkImage: UIImage? = .pharusIcons.checkmarkIcon,
        color: UIColor
    ) {
        self.task = task
        self.checkImage = checkImage
        self.color = color

        super.init(frame: .zero)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Codable
extension ProjectTaskView: ViewCodable {
    func buildHierarchy() {
        addSubview(mainStackView)
    }

    func setupConstraints() {
        mainStackView.edges()
    }

    func applyAdditionalChanges() {
        taskCheckmarkButton.setImage(self.checkImage, for: .normal)

        if let task = task {
            updateView(with: task)
        }
    }
}

// MARK: - Additional Methods
extension ProjectTaskView {
    func updateView(with task: Task) {
        taskTitleLabel.text = task.title
        taskCheckmarkButton.setImage(self.checkImage, for: .normal)
    }
}
