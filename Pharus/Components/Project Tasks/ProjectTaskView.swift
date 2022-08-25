//
//  ProjectTaskView.swift
//  Pharus
//
//  Created by Victor Colen on 11/04/22.
//

import UIKit
import PharusUI
import CoreApp

class ProjectTaskView: UIView {

    // MARK: - Properties
    weak var delegate: ProjectTaskDelegate?
    private var checkImage: UIImage?
    private var task: TaskModel
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

    lazy var taskCheckmarkButton = CheckmarkButton()
        .frame(width: 25, height: 25)

    // MARK: - Initializer
    init(
        task: TaskModel,
        checkImage: UIImage,
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
        taskTitleLabel.text = task.title
        taskTitleLabel.textColor = color

        taskCheckmarkButton.setImage(self.checkImage, for: .normal)
        taskCheckmarkButton.addAction(UIAction { [weak self] _ in
            if let self = self {
                self.checkmarkButtonTapped(task: self.task)
            }
        }, for: .touchUpInside)
    }
}

// MARK: - Delegate Actions
extension ProjectTaskView {
    func checkmarkButtonTapped(task: TaskModel) {
        delegate?.checkmarkButtonTapped(task: task)
    }
}
