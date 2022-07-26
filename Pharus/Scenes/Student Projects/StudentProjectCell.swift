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
    private lazy var mainStackView = VStackView([
        titleLabel,
        mentorLabel,
        descriptionTitleLabel,
        descriptionStackView,
        lowerStackView
    ])
        .setting(\.spacing, to: 20)
        .padding([.bottom, .leading, .trailing], 8)
        .padding([.top], 24.5)
        .setting(\.layer.cornerRadius, to: 16)
        .padding([.top, .leading, .bottom, .trailing], 16)

    private lazy var titleLabel = UILabel()
        .setting(\.numberOfLines, to: 1)
        .setting(\.lineBreakMode, to: .byTruncatingTail)
        .setting(\.font, to: .largeTitleBold)
        .setting(\.textColor, to: .black)

    private lazy var mentorLabel = UILabel()
        .setting(\.numberOfLines, to: 1)
        .setting(\.font, to: .mediumTitleBold)
        .setting(\.lineBreakMode, to: .byTruncatingTail)
        .setting(\.textColor, to: .black)

    private lazy var descriptionStackView = HStackView([
        descriptionLabel,
        completionStackView
    ])
        .setting(\.distribution, to: .fillEqually)
        .frame(height: 144)

    private lazy var descriptionTitleLabel = UILabel()
        .setting(\.text, to: "Descrição:")
        .setting(\.font, to: .mediumTitleSemiBold)
        .setting(\.textColor, to: .black)

    private lazy var descriptionLabel = UILabel()
        .setting(\.font, to: .smallBody)
        .setting(\.numberOfLines, to: 0)
        .setting(\.textColor, to: .black)

    private lazy var completionStackView = VStackView([
        completionHelperView,
        projectScheduleView
    ])
        .setting(\.alignment, to: .center)
        .setting(\.spacing, to: 26)

    private lazy var completionHelperView = VStackView([
        completionBarCircleView,
        percentageCompletionLabel
    ])

    private lazy var completionBarCircleView = CircleProgressView(
        circleColor: .white,
        completionProgressColor: UIColor.Purple.pharusPurple,
        radius: 45,
        progress: 50
    )
        .center(.allAxis)

    private lazy var percentageCompletionLabel = UILabel()
        .setting(\.text, to: "100%")
        .setting(\.font, to: .smallBody)
        .setting(\.textColor, to: .black)
        .center(.allAxis)

    private lazy var projectScheduleView = ProjectScheduleView(
        projectIsComplete: false,
        projectDaysRemaining: 12
    )
        .frame(height: 44)

    private lazy var lowerStackView = HStackView([
        partnershipStackView,
        subscribeHelperView
    ])
        .setting(\.distribution, to: .fillEqually)

    private lazy var partnershipStackView = HStackView([
        partnershipLabel,
        companyLogoHelperView
    ])
        .setting(\.spacing, to: 8)
        .setting(\.distribution, to: .fillEqually)

    private lazy var partnershipLabel = UILabel()
        .setting(\.text, to: "Parceria: ")
        .setting(\.font, to: .smallBodyBold)
        .setting(\.textColor, to: .black)
        .setting(\.textAlignment, to: .right)

    private lazy var companyLogoHelperView = VStackView([
        companyLogoImageView
    ])
        .setting(\.alignment, to: .leading)

    private lazy var companyLogoImageView = UIImageView()
        .setting(\.image, to: .pharusImages.companyImages.ioasysLogoImage)
        .setting(\.contentMode, to: .scaleAspectFit)

    private lazy var subscribeHelperView = VStackView([
        subscribeButton
    ])

    lazy var subscribeButton = SubscribeButton(isSubscribed: true)
        .center(.allAxis)

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
        addSubview(mainStackView)
    }

    func setupConstraints() {
        mainStackView.edges()
        subscribeButton.edges()
        percentageCompletionLabel.center(in: completionHelperView)
        completionBarCircleView.center(in: completionHelperView)
    }

    func applyAdditionalChanges() {
        self.backgroundColor = .clear
        setupBarCircleView()
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
        subscribeButton.originalView.isSubscribed = project.isSubscribed
        companyLogoImageView.image = UIImage(
            named: "\(project.company?.lowercased() ?? "ioasys")LogoImage"
        )

        completionBarCircleView.originalView.progress = project.completionPercentage*100
        percentageCompletionLabel.originalView.text = "\(project.completedTasksCount) de \(project.tasks.count)"

        if project.daysRemaining >= 0 {
            setBlackLabels()
            if project.isSubscribed {
                mainStackView.wrappedView.backgroundColor = UIColor.Project.orangeSubscribedProjectBackground
            } else {
                mainStackView.wrappedView.backgroundColor = UIColor.Project.grayUnsubscribedProjectBackground
            }
        } else {
            setWhiteLabels()
            mainStackView.wrappedView.backgroundColor = UIColor.Project.redExpiredProjectBackground
        }
    }

    private func setupBarCircleView() {
        // Making circle start from intended position
        completionBarCircleView.addSubview(percentageCompletionLabel)
        completionBarCircleView.transform = CGAffineTransform(rotationAngle: 180.7)

        // Returning label to horizontal position
        percentageCompletionLabel.transform = CGAffineTransform(rotationAngle: 1.5)
    }

    private func setBlackLabels() {
        titleLabel.textColor = .black
        mentorLabel.textColor = .black
        descriptionTitleLabel.textColor = .black
        descriptionLabel.textColor = .black
        partnershipLabel.textColor = .black
        percentageCompletionLabel.originalView.textColor = .black
    }

    private func setWhiteLabels() {
        titleLabel.textColor = .white
        mentorLabel.textColor = .white
        descriptionTitleLabel.textColor = .white
        descriptionLabel.textColor = .white
        partnershipLabel.textColor = .white
        percentageCompletionLabel.originalView.textColor = .white
    }
}
