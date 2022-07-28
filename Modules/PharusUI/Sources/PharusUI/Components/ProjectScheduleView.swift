//
//  ProjectScheduleView.swift
//  Pharus
//
//  Created by Victor Colen on 17/04/22.
//

import UIKit

public class ProjectScheduleView: UIView {

    // MARK: - Properties
    public var projectIsComplete: Bool {
        didSet {
            applyAdditionalChanges()
        }
    }

    public var projectDaysRemaining: Int {
        didSet {
            applyAdditionalChanges()
        }
    }

    // MARK: - Views
    private lazy var mainStackView = HStackView([
        iconImageView,
        textLabel
    ])
    .setting(\.spacing, to: 10)
    .padding([.leading, .trailing], 10)
    .setting(\.layer.cornerRadius, to: 8)

    private lazy var iconImageView = UIImageView()
        .setting(\.image, to: .pharusIcons.clockIcon)
        .frame(width: 36)
        .padding([.top, .bottom], 5)

    private lazy var textLabel = UILabel()
        .setting(\.text, to: "20 dias")
        .setting(\.font, to: .mediumBodyBold)

    // MARK: - Initilizer
    public init(
        projectIsComplete: Bool,
        projectDaysRemaining: Int
    ) {
        self.projectIsComplete = projectIsComplete
        self.projectDaysRemaining = projectDaysRemaining

        super.init(frame: .zero)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Codable
extension ProjectScheduleView: ViewCodable {
    public func buildHierarchy() {
        addSubview(mainStackView)
    }

    public func setupConstraints() {
        mainStackView.edges()
    }

    public func applyAdditionalChanges() {
        if projectIsComplete {
            setCompletedProject()
        } else {
            switch projectDaysRemaining {
            case ..<0:
                setExpiredProject()
            case 0...6:
                setFewDaysRemainingProject()
            case 7...8:
                setMediumDaysRemainingProject()
            default:
                setDefaultProject()
            }
        }
    }
}

// MARK: - Additional Methods
extension ProjectScheduleView {
    private func setCompletedProject() {
        iconImageView.originalView.image = .pharusIcons.checkIcon?.withTintColor(.black)
        textLabel.text = "Feito!"
        mainStackView.backgroundColor = UIColor.ProjectSchedule.greenBackground
    }

    private func setExpiredProject() {
        mainStackView.backgroundColor = .black
        textLabel.text = "Expirado"
        iconImageView.originalView.image = .pharusIcons.xmarkIcon?.withTintColor(.white)
    }

    private func setFewDaysRemainingProject() {
        mainStackView.backgroundColor = UIColor.ProjectSchedule.redBackground
        iconImageView.originalView.image = .pharusIcons.clockIcon ?? .defaultImage
        textLabel.text = "\(projectDaysRemaining) Dias"
        textLabel.textColor = .white
        iconImageView.originalView.image = iconImageView.originalView.image?.withTintColor(.white)
    }

    private func setMediumDaysRemainingProject() {
        iconImageView.originalView.image = .pharusIcons.clockIcon ?? .defaultImage
        textLabel.text = "\(projectDaysRemaining) Dias"
        mainStackView.backgroundColor = UIColor.ProjectSchedule.yellowBackground
    }

    private func setDefaultProject() {
        iconImageView.originalView.image = .pharusIcons.clockIcon ?? .defaultImage
        textLabel.text = "\(projectDaysRemaining) Dias"
        mainStackView.backgroundColor = UIColor.ProjectSchedule.orangeBackground
    }
}
