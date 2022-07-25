//
//  StudentProjectCell.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import UIKit
import PharusUI

class StudentProjectCell: UITableViewCell {

    // MARK: - Views
    private lazy var mainView = UIView()
        .setting(\.layer.cornerRadius, to: 16)

    private lazy var titleStackView = HStackView([])

    private lazy var descriptionStackView = HStackView([])
        .setting(\.distribution, to: .fillEqually)

    private lazy var mainStackView = VStackView([

    ])
        .setting(\.spacing, to: 20)
        .setting(\.translatesAutoresizingMaskIntoConstraints, to: false)

    private lazy var progressStackView = VStackView([])
        .setting(\.spacing, to: 8)

    private lazy var titleLabel = UILabel()
        .setting(\.numberOfLines, to: 1)
        .setting(\.lineBreakMode, to: .byTruncatingTail)
        .setting(\.font, to: .largeTitleBold)

    private lazy var mentorLabel = UILabel()
        .setting(\.numberOfLines, to: 1)
        .setting(\.font, to: .mediumTitleBold)
        .setting(\.lineBreakMode, to: .byTruncatingTail)

    private lazy var descriptionTitleLabel = UILabel()
        .setting(\.text, to: "Descrição:")
        .setting(\.font, to: .mediumTitleSemiBold)
        .setting(\.textColor, to: .black)

    private lazy var descriptionLabelView = UIView()

    private lazy var descriptionLabel = UILabel()
        .setting(\.font, to: .smallBody)
        .setting(\.numberOfLines, to: 0)
        .setting(\.textColor, to: .black)
        .setting(\.translatesAutoresizingMaskIntoConstraints, to: false)

    private lazy var completionStackView = VStackView([])
        .setting(\.alignment, to: .center)
        .setting(\.spacing, to: 26)

    private lazy var completionCircleHelpView = UIView()

    private lazy var completionBarCircleView = CircleProgressView(
        circleColor: .white,
        completionProgressColor: UIColor.Purple.pharusPurple,
        radius: 45,
        progress: 50
    )
        .setting(\.translatesAutoresizingMaskIntoConstraints, to: false)

    private lazy var percentageCompletionLabel = UILabel()
        .setting(\.text, to: "100%")
        .setting(\.font, to: .smallBody)
        .setting(\.textColor, to: .black)
        .setting(\.translatesAutoresizingMaskIntoConstraints, to: false)

    private lazy var projectScheduleView = ProjectScheduleView(
        projectIsComplete: false,
        projectDaysRemaining: 12
    )

    private lazy var lowerHelperView = UIView()

    private lazy var lowerStackView = HStackView([])
        .setting(\.distribution, to: .fillEqually)

    private lazy var partnershipStackView = HStackView([

    ])
        .setting(\.spacing, to: 8)
        .setting(\.distribution, to: .fillEqually)
        .setting(\.translatesAutoresizingMaskIntoConstraints, to: false)

    private lazy var partnershipHelperView = UIView()

    private lazy var partnershipLabel = UILabel()
        .setting(\.text, to: "Parceria: ")
        .setting(\.font, to: .smallBodyBold)
        .setting(\.textColor, to: .black)
        .setting(\.translatesAutoresizingMaskIntoConstraints, to: false)

    private lazy var companyLogoHelperView = UIView()

    private lazy var companyLogoImageView = UIImageView()
        .setting(\.image, to: .pharusImages.companyImages.ioasysLogoImage)
        .setting(\.contentMode, to: .scaleAspectFit)
        .setting(\.translatesAutoresizingMaskIntoConstraints, to: false)

    private lazy var subscribeHelperView = UIView()

    lazy var subscribeButton = SubscribeButton(isSubscribed: true)

    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Codable
extension StudentProjectCell: ViewCodable {
    func buildHierarchy() {
        self.backgroundColor = .clear

        addSubview(mainView)

        mainView.addSubview(mainStackView)

        mainStackView.addArrangedSubview(titleStackView)

        titleStackView.addArrangedSubview(titleLabel)

        mainStackView.addArrangedSubview(mentorLabel)
        mainStackView.addArrangedSubview(descriptionTitleLabel)
        mainStackView.addArrangedSubview(descriptionStackView)

        descriptionStackView.addArrangedSubview(descriptionLabelView)

        descriptionLabelView.addSubview(descriptionLabel)

        descriptionStackView.addArrangedSubview(completionStackView)

        completionStackView.addArrangedSubview(completionCircleHelpView)

        completionCircleHelpView.addSubview(completionBarCircleView)

        // Making circle start from intended position
        completionBarCircleView.transform = CGAffineTransform(rotationAngle: 180.7)

        completionCircleHelpView.addSubview(percentageCompletionLabel)

        completionStackView.addArrangedSubview(projectScheduleView)

        mainStackView.addArrangedSubview(lowerStackView)

        lowerStackView.addArrangedSubview(partnershipStackView)

        partnershipStackView.addArrangedSubview(partnershipHelperView)

        partnershipHelperView.addSubview(partnershipLabel)

        partnershipStackView.addArrangedSubview(companyLogoHelperView)

        companyLogoHelperView.addSubview(companyLogoImageView)

        lowerStackView.addArrangedSubview(subscribeHelperView)

        subscribeHelperView.addSubview(subscribeButton)
    }

    // MARK: - Constraints

    func setupConstraints() {

        // Main View
        self.stretch(mainView, top: 16, left: 16, bottom: -16, right: -16)

        // Main Stack View
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 8),
            mainStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -8),
            mainStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 24.5),
            mainStackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -8)
        ])

        // Mentors Label
        NSLayoutConstraint.activate([
            mentorLabel.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor)
        ])

        // Completion Stack View
        NSLayoutConstraint.activate([
            completionStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor)
        ])

        // Description Stack View
        NSLayoutConstraint.activate([
            descriptionStackView.heightAnchor.constraint(equalToConstant: 144)
        ])

        // Description Label
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: descriptionLabelView.topAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: descriptionLabelView.trailingAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionLabelView.leadingAnchor),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: descriptionLabelView.bottomAnchor)
        ])

        // Percentage Completion Label
        NSLayoutConstraint.activate([
            percentageCompletionLabel.centerXAnchor.constraint(equalTo: completionCircleHelpView.centerXAnchor),
            percentageCompletionLabel.centerYAnchor.constraint(equalTo: completionCircleHelpView.centerYAnchor)
        ])

        // Completion Bar Circle View
        NSLayoutConstraint.activate([
            completionBarCircleView.centerXAnchor.constraint(equalTo: completionCircleHelpView.centerXAnchor),
            completionBarCircleView.centerYAnchor.constraint(equalTo: completionCircleHelpView.centerYAnchor)
        ])

        // Project Schedule View
        NSLayoutConstraint.activate([
            projectScheduleView.heightAnchor.constraint(equalToConstant: 44)
        ])

        // Company Logo Image View
        NSLayoutConstraint.activate([
            companyLogoImageView.widthAnchor.constraint(equalToConstant: 66),
            companyLogoImageView.heightAnchor.constraint(equalToConstant: 66),
            companyLogoImageView.leadingAnchor.constraint(equalTo: companyLogoHelperView.leadingAnchor),
            companyLogoImageView.centerYAnchor.constraint(equalTo: partnershipStackView.centerYAnchor)
        ])

        // Partnership Label
        NSLayoutConstraint.activate([
            partnershipLabel.trailingAnchor.constraint(equalTo: partnershipHelperView.trailingAnchor),
            partnershipLabel.centerYAnchor.constraint(equalTo: partnershipStackView.centerYAnchor)
        ])

        // Subscribe Button
        subscribeButton.center(in: subscribeHelperView)
    }
}

// MARK: - Additional Methods
extension StudentProjectCell {
    func configureCell(using project: ProjectModel) {
        titleLabel.text = project.name
        descriptionLabel.text = project.projectDescription
        mentorLabel.text = "Mentor: " + project.mentor
        projectScheduleView.projectIsComplete = project.isComplete
        projectScheduleView.projectDaysRemaining = project.daysRemaining
        subscribeButton.isSubscribed = project.isSubscribed
        companyLogoImageView.image = UIImage(
            named: "\(project.company?.lowercased() ?? "ioasys")LogoImage"
        )

        completionBarCircleView.progress = project.completionPercentage*100
        percentageCompletionLabel.text = "\(project.completedTasksCount) de \(project.tasks.count)"

        if project.daysRemaining >= 0 {
            if project.isSubscribed {
                mainView.backgroundColor = UIColor.Project.orangeSubscribedProjectBackground
            } else {
                mainView.backgroundColor = UIColor.Project.grayUnsubscribedProjectBackground
            }
        } else {
            mainView.backgroundColor = UIColor.Project.redExpiredProjectBackground
            titleLabel.textColor = .white
            mentorLabel.textColor = .white
            descriptionTitleLabel.textColor = .white
            descriptionLabel.textColor = .white
            partnershipLabel.textColor = .white
            percentageCompletionLabel.textColor = .white
        }
    }
}
