//
//  StudentProjectRankingCell.swift
//  Pharus
//
//  Created by Victor Colen on 04/04/22.
//
import UIKit
import PharusUI

class StudentProjectRankingCell: UITableViewCell {

    private lazy var mainStackView = VStackView([
        projectTitleLabel,
        congratulationsLabel,
        placementStackView,
        mentorCommentsStackView
    ])
        .setting(\.spacing, to: 32)
        .padding([.top, .leading, .trailing, .bottom], 16)
        .setting(\.backgroundColor, to: .Purple.pharusPurple)
        .setting(\.layer.cornerRadius, to: 16)
        .padding([.top], 24.5)
        .padding([.leading, .bottom, .trailing], 8)

    private lazy var projectTitleLabel = UILabel()
        .setting(\.textAlignment, to: .center)
        .setting(\.textColor, to: .white)
        .setting(\.font, to: .largeTitleBold)

    private lazy var congratulationsLabel = UILabel()
        .setting(\.text, to: "Parabéns! Você alcançou o")
        .setting(\.numberOfLines, to: 2)
        .setting(\.textAlignment, to: .center)
        .setting(\.textColor, to: .white)
        .setting(\.font, to: .mediumTitleSemiBold)

    private lazy var placementStackView = HStackView([
        placementHelperView,
        medalHelperView
    ])
        .setting(\.distribution, to: .fillEqually)
        .frame(height: 133)

    private lazy var placementHelperView = UIView()

    private lazy var placementImageView = UIImageView()
        .setting(\.image, to: .pharusImages.thirdPlaceImage)

    private lazy var medalImageView = UIImageView()
        .setting(\.image, to: .pharusImages.thirdPlaceMedalImage)

    private lazy var medalHelperView = UIView()

    private lazy var mentorCommentsStackView = VStackView([])

    private lazy var mentorCommentsTitleHelperView = UIView()

    private lazy var mentorCommentsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Comentários do Mentor"
        label.font = .mediumBodyBold
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectRankingCell.mentorCommentsStackView"

        return label
    }()

    private lazy var mentorCommentsDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Nulla bibendum elit tellus, at condimentum mauris sagittis ut. Nam auctor nunc non ipsum blandit tempus.
"""
        label.font = .smallBody
        label.textColor = .white
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectRankingCell.mentorCommentsStackView"

        return label
    }()

    private lazy var mentorCommentsDescriptionHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectRankingCell.mentorCommentsDescriptionHelperView"

        return view
    }()

    // MARK: - Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews

    func configureCell(using project: ProjectModel) {
        self.projectTitleLabel.text = project.name
        mentorCommentsDescriptionLabel.text = project.scoreDescription
        configureSubviews(with: project)
        setupConstraints()
    }

    private func configureSubviews(with project: ProjectModel) {
        self.backgroundColor = .clear

        addSubview(mainStackView)

        placementHelperView.addSubview(placementImageView)

        medalHelperView.addSubview(medalImageView)

        mentorCommentsStackView.addArrangedSubview(mentorCommentsTitleHelperView)

        mentorCommentsTitleHelperView.addSubview(mentorCommentsTitleLabel)

        mentorCommentsStackView.addArrangedSubview(mentorCommentsDescriptionHelperView)

        mentorCommentsDescriptionHelperView.addSubview(mentorCommentsDescriptionLabel)

        setPlacementImages(with: project)
    }

    private func setPlacementImages(with project: ProjectModel) {
        guard let projectPlacement = project.placement else {
            return
        }

        if projectPlacement < 6 {
            switch project.placement {
            case 1:
                placementImageView.image = .pharusImages.firstPlaceImage
                medalImageView.image = .pharusImages.firstPlaceMedalImage
            case 2:
                placementImageView.image = .pharusImages.secondPlaceImage
                medalImageView.image = .pharusImages.secondPlaceMedalImage
            case 3:
                placementImageView.image = .pharusImages.thirdPlaceImage
                medalImageView.image = .pharusImages.thirdPlaceMedalImage
            case 4:
                placementImageView.image = .pharusImages.fourthPlaceImage
                medalImageView.image = .pharusImages.fourthPlaceMedalImage
            default:
                placementImageView.image = .pharusImages.fifthPlaceImage
                medalImageView.image = .pharusImages.fifthPlaceMedalImage
            }

            // Placement Image View
            placementImageView.center(in: placementHelperView)
            NSLayoutConstraint.activate([
                placementImageView.heightAnchor.constraint(equalToConstant: 102),
                placementImageView.widthAnchor.constraint(equalTo: placementHelperView.widthAnchor)
            ])

            // Medal Image View
            medalImageView.center(in: medalHelperView)
            NSLayoutConstraint.activate([
                medalImageView.heightAnchor.constraint(equalToConstant: 104),
                medalImageView.widthAnchor.constraint(equalToConstant: 104)
            ])

        } else {
            placementImageView.removeFromSuperview()
            medalImageView.removeFromSuperview()
            congratulationsLabel.text = "Parabéns! Você completou o projeto e sua colocação foi:"

            placementStackView.axis = .vertical
            placementStackView.removeFullyAllArrangedSubviews()

            let notOnPodiumLabel = UILabel()
            notOnPodiumLabel.font = .largeTitleBold
            notOnPodiumLabel.textColor = .white
            notOnPodiumLabel.text = "\(project.placement ?? 6)º Lugar"
            notOnPodiumLabel.textAlignment = .center

            placementStackView.addArrangedSubview(notOnPodiumLabel)
            mentorCommentsTitleLabel.font = UIFont.mediumBody
        }
    }

    // MARK: - Constraints

    private func setupConstraints() {
        mainStackView.edges()

        // Mentor Comments Title Helper View
        NSLayoutConstraint.activate([
            mentorCommentsTitleHelperView.heightAnchor.constraint(equalToConstant: 54)
        ])

        // Mentor Comments Title Label
        mentorCommentsTitleLabel.center(in: mentorCommentsTitleHelperView)

        // Mentor Comment Description Helper View
        NSLayoutConstraint.activate([
            mentorCommentsDescriptionHelperView.heightAnchor.constraint(equalToConstant: 80)
        ])

        // Mentor Comments Description Label
        NSLayoutConstraint.activate([
            mentorCommentsDescriptionLabel.leadingAnchor.constraint(
                equalTo: mentorCommentsTitleHelperView.leadingAnchor,
                constant: 9
            ),
            mentorCommentsDescriptionLabel.trailingAnchor.constraint(
                equalTo: mentorCommentsTitleHelperView.trailingAnchor,
                constant: -9
            )
        ])
    }
}
