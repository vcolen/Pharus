//
//  StudentProjectDetailView.swift
//  Pharus
//
//  Created by Victor Colen on 05/04/22.
//

import UIKit
import PharusUI

// swiftlint:disable line_length
class StudentProjectDetailView: UIView {

    // MARK: - Properties
    weak var delegate: StudentProjectDetailViewDelegate?
    var project: ProjectModel

    // MARK: - Views
    private lazy var mainScrollView = VScrollView {
        VStackView([
            HStackView([
                mentorLabel,
                mentorReviewHelperView
            ])
            .setting(\.spacing, to: 8),

            VStackView([
                UILabel()
                    .setting(\.text, to: "Descrição:")
                    .setting(\.font, to: .mediumTitleMedium)
                    .setting(\.textColor, to: .black),

                descriptionTextLabel
            ])
            .setting(\.spacing, to: 16),

            rulesStackView,
            taskTitleLabel,
            tasksStackView,

            VStackView([
                completedTasksLabel,
                completedTasksProgressView
            ])
            .setting(\.spacing, to: 16),

            uploadFilesButton
        ])
        .setting(\.spacing, to: 24)
        .padding([.top, .leading, .trailing], 24)
        .padding(.bottom, 10)
        .setting(\.backgroundColor, to: .Modal.yellowBackground)
        .setting(\.layer.cornerRadius, to: 16)
        .padding(.top, 50)
        .padding([.leading, .trailing], 16)
        .padding(.bottom, 10)
        .center(.horizontally)
    }

    private lazy var mentorLabel = UILabel()
        .setting(\.textColor, to: .black)
        .setting(\.font, to: .mediumTitleBold)

    private lazy var mentorReviewHelperView = VStackView([
        mentorReviewImageView
    ])
    .frame(width: 36, height: 36)

    private lazy var mentorReviewImageView = UIImageView()
        .setting(\.image, to: .pharusIcons.envelopeIcon)
        .frame(width: 36, height: 36)

    private lazy var descriptionTextLabel = UILabel()
        .setting(\.numberOfLines, to: 0)
        .setting(\.font, to: .smallBody)
        .setting(\.textColor, to: .black)
        .setting(\.text, to: Constants.defaultTexts.lorem)

    private lazy var rulesStackView = HStackView([
        rulesLabel,

        UIImageView()
            .setting(\.image, to: .pharusIcons.rightArrowIcon)
            .frame(width: 24, height: 24)
    ])
    .setting(\.spacing, to: 9)
    .center(.horizontally)

    private lazy var rulesLabel = UILabel()
        .setting(\.text, to: "Atividades do projeto")
        .setting(\.textColor, to: .Project.redText)
        .setting(\.font, to: .largeTitleMedium)

    private lazy var tasksStackView = VStackView([
        taskTitleLabel,
        taskHelperStackView
    ])
    .setting(\.spacing, to: 29)

    private lazy var taskTitleLabel = UILabel()
        .setting(\.text, to: "Lista de Tarefas")
        .setting(\.font, to: .mediumTitleSemiBold)
        .setting(\.textColor, to: .black)

    private lazy var taskHelperStackView = VStackView([])
        .setting(\.spacing, to: 30)

    private lazy var completedTasksLabel = UILabel()
        .setting(\.textAlignment, to: .center)
        .setting(\.numberOfLines, to: 0)
        .setting(\.font, to: .smallTitleMedium)
        .setting(\.textColor, to: .black)

    private lazy var completedTasksProgressView = UIProgressView()
        .setting(\.layer.cornerRadius, to: 8)
        .setting(\.progress, to: 0.75)
        .setting(\.clipsToBounds, to: true)
        .setting(\.trackTintColor, to: .white)
        .setting(\.progressTintColor, to: .Project.greenProgress)
        .frame(height: 22)

    private lazy var uploadFilesButton = MainCardButton(title: "Enviar Arquivos", buttonState: .normal)

    // MARK: - Initializer
    init(project: ProjectModel) {
        self.project = project

        super.init(frame: .zero)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Codable
extension StudentProjectDetailView: ViewCodable {
    func buildHierarchy() {
        addSubview(mainScrollView)
    }

    func setupConstraints() {
        mainScrollView.edges()
    }

    func applyAdditionalChanges() {
        mentorLabel.text = project.mentor
        descriptionTextLabel.text = project.projectDescription
        setupProjectTasks(of: project)

        if project.isSubscribed == false {
            configureUnsubscribedProject(with: project)
        }

        if project.isComplete {
            uploadFilesButton.disable()
        }

        if project.scoreDescription != nil {
            mentorReviewImageView.image = .pharusIcons.notificationEnvelopeIcon
            mentorReviewHelperView.setOnClickListener { [weak self] in
                self?.envelopeIconTapped()
            }
        }

        rulesStackView.setOnClickListener { [weak self] in
            self?.rulesViewTapped()
        }

        uploadFilesButton.addAction(UIAction { [weak self] _ in
            self?.uploadFilesButtonTapped()
        }, for: .touchUpInside)
    }
}

// MARK: - Additional Mehtods
extension StudentProjectDetailView {
    private func setupProjectTasks(of project: ProjectModel) {
        for taskIndex in project.tasks.indices {
            let task = project.tasks[taskIndex]
            let checkboxIcon = task.isComplete ? UIImage.pharusIcons.checkmarkIcon ?? .defaultImage : .defaultImage
            let taskView = ProjectTaskView(
                task: task,
                checkImage: checkboxIcon,
                color: project.isSubscribed ? .black : UIColor.Project.grayDisabledText
            )

            #warning("TODO - update checkmark when button tapped")
            if project.isComplete == false && project.isSubscribed == true {
                taskView.taskCheckmarkButton.addAction(
                    UIAction { [weak self, weak taskView] _ in
                        self?.taskCheckboxTapped(taskIndex: taskIndex)
                        if project.tasks[taskIndex].isComplete {
                            taskView?.taskCheckmarkButton.setImage(
                                .pharusIcons.checkmarkIcon,
                                for: .normal
                            )
                        } else {
                            taskView?.taskCheckmarkButton.setImage(
                                .defaultImage,
                                for: .normal
                            )
                        }
                        self?.updateProjectProgressView()
                    }, for: .touchUpInside
                )
            }
            taskHelperStackView.addArrangedSubview(taskView)
        }
        updateProjectProgressView()
    }

    private func configureUnsubscribedProject(with project: ProjectModel) {
        mentorReviewImageView.image = mentorReviewImageView.image?.withTintColor(UIColor.Project.grayDisabledText)
        rulesLabel.textColor = UIColor.Project.grayDisabledText
        completedTasksLabel.textColor = UIColor.Project.grayDisabledText
        taskTitleLabel.textColor = UIColor.Project.grayDisabledText
        completedTasksProgressView.trackTintColor = UIColor.Button.grayDisabledBackground
        uploadFilesButton.disable()

        for case let taskView as ProjectTaskView in tasksStackView.arrangedSubviews {
            taskView.color = UIColor.Project.grayDisabledText
        }
    }

    private func updateProjectProgressView() {
        let roundedPercentage: Float = project.completionPercentage*100

        completedTasksLabel.text = """
Completadas \(project.completedTasksCount) de \(project.tasks.count) tarefas (\(roundedPercentage.withDecimalPoints(2))%)
"""
        completedTasksProgressView.progress = project.completionPercentage
    }
}

// MARK: - Delegate Actions
extension StudentProjectDetailView {

    func envelopeIconTapped() {
        delegate?.envelopeIconTapped()
    }

    func taskCheckboxTapped(taskIndex: Int) {
        delegate?.taskCheckboxTapped(taskIndex: taskIndex)
    }

    func rulesViewTapped() {
        delegate?.rulesViewTapped()
    }

    func uploadFilesButtonTapped() {
        delegate?.uploadFilesButtonTapped()
    }
}
