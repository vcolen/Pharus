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

    private  lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.Modal.yellowBackground
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectDetailView.mainView"

        return view
    }()

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

    private lazy var mentorLabel: UILabel = {
        let label = UILabel()
        label.font = .largeTitleBold
        label.textColor = .black
        label.font = .mediumTitleBold
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectDetailView.mentorLabel"

        return label
    }()

    private lazy var mentorReviewHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectDetailView.mentorReviewHelperView"

        return view
    }()

    private lazy var mentorReviewImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.pharusIcons.envelopeIcon
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "StudentProjectDetailView.mentorReviewImageView"

        return imageView
    }()

    private lazy var descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectDetailView.descriptionStackView"

        return stackView
    }()

    private lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Descrição:"
        label.font = .mediumTitleMedium
        label.textColor = .black
        label.font = .mediumTitleMedium
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectDetailView.descriptionTitleLabel"

        return label
    }()

    private lazy var descriptionTextLabel: UILabel = {
        let label = UILabel()
        label.text = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Nulla bibendum elit tellus, at condimentum mauris sagittis ut. Nam auctor nunc non ipsum blandit tempus.
"""
        label.numberOfLines = 0
        label.font = .smallBody
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectDetailView.descriptionTextLabel"

        return label
    }()

    private lazy var rulesHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectDetailView.rulesHelperView"

        return view
    }()

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

    private lazy var rulesArrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.pharusIcons.rightArrowIcon
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "StudentProjectDetailView.rulesBoookImageView"

        return imageView
    }()

    private lazy var rulesLabel: UILabel = {
        let label = UILabel()
        label.text = "Atividades do projeto"
        label.textColor = UIColor.Project.redText
        label.font = .largeTitleMedium
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectDetailView.descriptionLabel"

        return label
    }()

    private lazy var tasksStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 29
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectDetailView.taskStackView"

        return stackView
    }()

    private lazy var tasksTitleHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectDetailView.taskStackView"

        return view
    }()

    private lazy var taskTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lista de Tarefas"
        label.font = .mediumTitleSemiBold
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectDetailView.taskTitleLabel"

        return label
    }()

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

    private lazy var completedTasksLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .smallTitleMedium
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectDetailView.completedTasksLabel"

        return label
    }()

    private lazy var completedTasksProgressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.layer.cornerRadius = 8
        progressView.progress = 0.75
        progressView.clipsToBounds = true
        progressView.trackTintColor = .white
        progressView.progressTintColor = UIColor.Project.greenProgress
        progressView.accessibilityIdentifier = "StudentProjectDetailView.completedTasksProgressView"

        return progressView
    }()

    private lazy var uploadFilesHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectDetailView.uploadFilesHelperView"

        return view
    }()

    private lazy var uploadFilesButton: MainCardButton = {
        let button = MainCardButton(title: "Enviar Arquivos", buttonState: .normal)
        button.addAction(UIAction { [weak self] _ in
            self?.sendFilesButtonTapped()
        }, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "StudentProjectDetailView.uploadFilesButton"

        return button
    }()

    // MARK: - Initializer
    init(project: ProjectModel) {
        self.project = project

        super.init(frame: .zero)

        configureSubviews()
        customizeSubviews(with: project)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews

    func configureSubviews() {
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

    func customizeSubviews(with project: ProjectModel) {
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
    }

    private func setupProjectTasks(of project: ProjectModel) {
        for task in project.tasks {
            let checkboxIcon = task.isComplete ? UIImage.pharusIcons.checkmarkIcon ?? .defaultImage : .defaultImage
            let taskView = ProjectTaskView(
                task: task,
                checkImage: checkboxIcon,
                color: project.isSubscribed ? .black : UIColor.Project.grayDisabledText
            )

            if project.isComplete == false && project.isSubscribed == true {
            taskView.taskCheckmarkButton.addAction(
                UIAction { [weak self, weak taskView] _ in
                        self?.taskCheckboxTapped(task: task)
                        let newIcon = task.isComplete ? UIImage.pharusIcons.checkmarkIcon : .defaultImage
                        taskView?.taskCheckmarkButton.setImage(newIcon, for: .normal)
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

    // MARK: - Constraints

    private func setupConstraints() {

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

        // Mentor Review Image View
        NSLayoutConstraint.activate([
            mentorReviewImageView.widthAnchor.constraint(equalToConstant: 36),
            mentorReviewImageView.heightAnchor.constraint(equalToConstant: 36)
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
}

// MARK: - Actions

extension StudentProjectDetailView {

    func envelopeIconTapped() {
        delegate?.envelopeIconTapped()
    }

    func taskCheckboxTapped(task: TaskModel) {
        delegate?.taskCheckboxTapped(task: task)
    }

    func rulesViewTapped() {
        delegate?.rulesViewTapped()
    }

    func sendFilesButtonTapped() {
        delegate?.sendFilesButtonTapped()
    }
}
