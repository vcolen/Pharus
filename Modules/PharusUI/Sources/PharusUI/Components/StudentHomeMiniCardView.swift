//
//  StudentHomeMiniCardView.swift
//  Pharus
//
//  Created by Victor Colen on 12/04/22.
//

import UIKit

public class StudentHomeMiniCardView: UIView {

    // MARK: - Properties
    private var cardType: HomeCardType
    private var message: String

    public enum HomeCardType {
        case warning
        case newProject
        case newMedal
    }

    // MARK: - Views
    private lazy var mainStackView = VStackView([
        VStackView([
            cardIconImageView
        ])
        .setting(\.alignment, to: .center),

        VStackView([
            cardDescriptionLabel
        ])
    ])
    .setting(\.spacing, to: 15)
    .padding([.all], 10)
    .setting(\.layer.cornerRadius, to: 16)

    private lazy var cardIconImageView = UIImageView()
        .setting(\.image, to: .pharusImages.fifthPlaceMedalImage)
        .frame(height: 42)

    private lazy var cardDescriptionLabel = UILabel()
        .setting(\.text, to: "O projeto ”Introdução a Robótica” te deu uma medalha!")
        .setting(\.textAlignment, to: .center)
        .setting(\.numberOfLines, to: 0)
        .setting(\.textColor, to: .black)
        .setting(\.font, to: .smallBody)

    // MARK: - Initializer
    public init(
        cardType: HomeCardType,
        message: String
    ) {
        self.cardType = cardType
        self.message = message

        super.init(frame: .zero)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Codable
extension StudentHomeMiniCardView: ViewCodable {
    public func buildHierarchy() {
        addSubview(mainStackView)
    }

    public func setupConstraints() {
        mainStackView.edges()
    }

    public func applyAdditionalChanges() {
        if cardType == .newProject {
            mainStackView.backgroundColor = UIColor.Card.orangeHomeStandardCardBackground
            cardIconImageView.image = UIImage.pharusIcons.companyIcon
        } else if cardType == .warning {
            mainStackView.backgroundColor = UIColor.Card.yellowHomeAlertCardBackground
            cardIconImageView.image = UIImage.pharusIcons.warningIcon
        } else {
            mainStackView.backgroundColor = UIColor.Card.orangeHomeStandardCardBackground
            cardIconImageView.image = UIImage.pharusIcons.medalIcon
        }

        cardDescriptionLabel.text = message
    }
}
