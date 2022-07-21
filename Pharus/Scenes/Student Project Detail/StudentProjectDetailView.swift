//
//  StudentProjectDetailView.swift
//  Pharus
//
//  Created by Victor Colen on 05/04/22.
//

import UIKit
import PharusUI

// swiftlint:disable type_body_length file_length
class StudentProjectDetailView: UIView {

    // MARK: - Properties
    weak var delegate: StudentProjectDetailViewDelegate?
    private var project: ProjectModel

    // MARK: - Views
    private lazy var mainScrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.accessibilityIdentifier = "StudentProjectDetailView.mainScrollView"

        return scrollView
    }()

    private lazy var mainView = UIView()
        .setting(\.backgroundColor, to: .Modal.yellowBackground)
        .setting(\.layer.cornerRadius, to: 16)

    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectDetailView.mainStackView"

        return stackView
    }()

    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectDetailView.titleStackView"

        return stackView
    }()

    private lazy var mentorLabel = UILabel()
        .setting(\.textColor, to: .black)
        .setting(\.font, to: .mediumTitleBold)

    private lazy var mentorReviewHelperView = UIView()

    private lazy var mentorReviewImageView = UIImageView()
        .setting(\.image, to: .pharusIcons.envelopeIcon)
        .frame(width: 36, height: 36)

    private lazy var descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectDetailView.descriptionStackView"

        return stackView
    }()

    private lazy var descriptionTitleLabel = UILabel()
        .setting(\.text, to: "Descrição:")
        .setting(\.font, to: .mediumTitleMedium)
        .setting(\.textColor, to: .black)

    private lazy var descriptionTextLabel = UILabel()
        .setting(\.numberOfLines, to: 0)
        .setting(\.font, to: .smallBody)
        .setting(\.textColor, to: .black)
        .setting(\.text,
                  to: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Nulla bibendum elit tellus, at condimentum mauris sagittis ut. Nam auctor nunc non ipsum blandit tempus.
""")

    private lazy var rulesHelperView = UIView()

    private lazy var rulesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setOnClickListener { [weak self] in
            self?.rulesViewTapped()
        }
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectDetailView.rulesStackView"

        return stackView
    }()

    private lazy var rulesArrowImageView = UIImageView()
        .setting(\.image, to: .pharusIcons.rightArrowIcon)

    private lazy var rulesLabel = UILabel()
        .setting(\.text, to: "Atividades do projeto")
        .setting(\.textColor, to: .Project.redText)
        .setting(\.font, to: .largeTitleMedium)

    private lazy var tasksStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 29
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectDetailView.taskStackView"

        return stackView
    }()

    private lazy var tasksTitleHelperView = UIView()

    private lazy var taskTitleLabel = UILabel()
        .setting(\.text, to: "Lista de Tarefas")
        .setting(\.font, to: .mediumTitleSemiBold)
        .setting(\.textColor, to: .black)
        .setting(\.translatesAutoresizingMaskIntoConstraints, to: false); #warning("tirar")

    private lazy var taskHelperStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectDetailView.individualTaskHelperStackView"

        return stackView
    }()

    private lazy var completedTasksProgressStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectDetailView.completedTasksProgressStackView"

        return stackView
    }()

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

    private lazy var uploadFilesHelperView = UIView()

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

        mainScrollView.addSubview(mainView)

        mainView.addSubview(mainStackView)

        mainStackView.addArrangedSubview(titleStackView)

        titleStackView.addArrangedSubview(mentorLabel)
        titleStackView.addArrangedSubview(mentorReviewHelperView)

        mentorReviewHelperView.addSubview(mentorReviewImageView)

        mainStackView.addArrangedSubview(descriptionStackView)

        descriptionStackView.addArrangedSubview(descriptionTitleLabel)
        descriptionStackView.addArrangedSubview(descriptionTextLabel)

        mainStackView.addArrangedSubview(rulesHelperView)

        rulesHelperView.addSubview(rulesStackView)

        rulesStackView.addArrangedSubview(rulesLabel)
        rulesStackView.addArrangedSubview(rulesArrowImageView)

        mainStackView.addArrangedSubview(tasksStackView)

        tasksStackView.addArrangedSubview(tasksTitleHelperView)
        tasksTitleHelperView.addSubview(taskTitleLabel)

        tasksStackView.addArrangedSubview(taskHelperStackView)

        mainStackView.addArrangedSubview(completedTasksProgressStackView)

        completedTasksProgressStackView.addArrangedSubview(completedTasksLabel)
        completedTasksProgressStackView.addArrangedSubview(completedTasksProgressView)

        mainStackView.addArrangedSubview(uploadFilesHelperView)

        uploadFilesHelperView.addSubview(uploadFilesButton)
    }

     func setupConstraints() {

        // Scroll View
        self.stretch(mainScrollView)

        // Main View
        self.stretch(mainView, to: mainScrollView, top: 50, left: 16, bottom: -10, right: -16)

        // Main Stack View
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 24),
            mainStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 24),
            mainStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -24),
            mainStackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -10),
            mainStackView.centerXAnchor.constraint(equalTo: mainScrollView.centerXAnchor)
        ])

        // Mentor Review Helper View
        NSLayoutConstraint.activate([
            mentorReviewHelperView.widthAnchor.constraint(equalToConstant: 36),
            mentorReviewHelperView.heightAnchor.constraint(equalToConstant: 36)
        ])

        // Rules Stack Helper View
        NSLayoutConstraint.activate([
            rulesHelperView.heightAnchor.constraint(equalToConstant: 30)
        ])

        // Rules Stack View
        rulesStackView.center(in: rulesHelperView)

        // Rules Book Image View
        NSLayoutConstraint.activate([
            rulesArrowImageView.widthAnchor.constraint(equalToConstant: 24),
            rulesArrowImageView.heightAnchor.constraint(equalToConstant: 24)
        ])

        // Tasks Title Helper
        NSLayoutConstraint.activate([
            tasksTitleHelperView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            tasksTitleHelperView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            tasksTitleHelperView.heightAnchor.constraint(equalToConstant: 30)
        ])

        // Completed Tasks Progress View
        NSLayoutConstraint.activate([
            completedTasksProgressView.heightAnchor.constraint(equalToConstant: 22)
        ])

        // Upload Files Helper View
        NSLayoutConstraint.activate([
            uploadFilesHelperView.heightAnchor.constraint(equalToConstant: 50)
        ])

        // Upload Files Button
        uploadFilesButton.center(in: uploadFilesHelperView)
        NSLayoutConstraint.activate([
            uploadFilesButton.widthAnchor.constraint(equalToConstant: 195)
        ])
    }

    func applyAdditionalChanges() {
        mentorLabel.text = project.mentor
        descriptionTextLabel.text = project.projectDescription
        setupProjectTasks(of: project)

        if !project.isSubscribed {
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

        uploadFilesButton.addAction(UIAction { [weak self] _ in
            self?.uploadFilesButtonTapped()
        }, for: .touchUpInside)
    }
}

// MARK: - Additional Changes
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
Completadas \(project.completedTasksCount) de \(project.tasks.count) tarefas \(roundedPercentage.withDecimalPoints(2))%)
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
