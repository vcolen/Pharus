//
//  StudentProjectsRankingCell.swift
//  Pharus
//
//  Created by Victor Colen on 04/04/22.
//

import UIKit
import PharusUI

class StudentProjectsRankingCell: UITableViewCell {

    // MARK: - Views
    private lazy var mainStackView = VStackView([
        projectTitleLabel,
        congratulationsLabel,
        placementStackView,

        VStackView([
            VStackView([
                mentorCommentsTitleLabel
            ])
            .frame(height: 54),

            VStackView([
                mentorCommentsDescriptionLabel
            ])
            .frame(height: 80)
        ])
    ])
    .setting(\.spacing, to: 32)
    .padding([.all], 16)
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
        placementImageView,
        medalImageView
    ])
        .setting(\.spacing, to: 30)
        .frame(height: 103)

    private lazy var placementImageView = UIImageView()
        .setting(\.image, to: .pharusImages.thirdPlaceImage)

    private lazy var medalImageView = UIImageView()
        .setting(\.image, to: .pharusImages.thirdPlaceMedalImage)
        .frame(width: 104)

    private lazy var mentorCommentsTitleLabel = UILabel()
        .setting(\.text, to: "Comentários do Mentor")
        .setting(\.font, to: .mediumTitleBold)
        .setting(\.textColor, to: .white)
        .setting(\.textAlignment, to: .center)

    private lazy var mentorCommentsDescriptionLabel = UILabel()
        .setting(\.text, to: Constants.defaultTexts.lorem)
        .setting(\.font, to: .smallBody)
        .setting(\.textColor, to: .white)
        .setting(\.numberOfLines, to: 4)
        .padding([.leading, .trailing], 9)

    // MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Codable
extension StudentProjectsRankingCell: ViewCodable {
    func buildHierarchy() {
        addSubview(mainStackView)
    }

    func setupConstraints() {
        mainStackView.edges()
    }

    func applyAdditionalChanges() {
        self.backgroundColor = .clear
    }
}

// MARK: - Additional Methods
extension StudentProjectsRankingCell {
    func configureCell(using project: ProjectModel) {
        self.projectTitleLabel.text = project.name
        mentorCommentsDescriptionLabel.originalView.text = project.scoreDescription

        setupView()
        setPlacementImages(with: project)
    }

    private func setPlacementImages(with project: ProjectModel) {
        guard let projectPlacement = project.placement else {
            return
        }

        if projectPlacement < 6 {
            setOnPodiumView(with: projectPlacement)
        } else {
            setNotOnPodiumView(with: projectPlacement)
        }
    }

    private func setOnPodiumView(with placement: Int) {
        switch placement {
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
    }

    private func setNotOnPodiumView(with placement: Int) {
        placementImageView.removeFromSuperview()
        medalImageView.removeFromSuperview()
        congratulationsLabel.text = "Parabéns! Você completou o projeto e sua colocação foi:"

        placementStackView.axis = .vertical
        placementStackView.removeFullyAllArrangedSubviews()
        placementStackView.addArrangedSubview(
            UILabel()
                .setting(\.font, to: .largeTitleBold)
                .setting(\.textColor, to: .white)
                .setting(\.text, to: "\(placement)º Lugar")
                .setting(\.textAlignment, to: .center)
        )

        mentorCommentsTitleLabel.font = UIFont.mediumBody
    }
}
