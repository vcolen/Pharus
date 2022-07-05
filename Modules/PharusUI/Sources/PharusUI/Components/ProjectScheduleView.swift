//
//  ProjectScheduleView.swift
//  Pharus
//
//  Created by Victor Colen on 17/04/22.
//

import UIKit

@available(iOS 13.0, *)
public class ProjectScheduleView: UIView {

    // MARK: - Propertiess
    public var projectIsComplete: Bool {
        didSet {
            customizeSubviews()
        }
    }

    public var projectDaysRemaining: Int {
        didSet {
            customizeSubviews()
        }
    }

    // MARK: - Views
    private lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "ProjectScheduleView.mainView"
        view.layer.cornerRadius = 8

        return view
    }()

    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "ProjectScheduleView.mainStackView"

        return stackView
    }()

    private lazy var iconHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "ProjectScheduleView.iconHelperView"

        return view
    }()

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .pharusIcons.clockIcon
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "ProjectScheduleView.iconImageView"

        return imageView
    }()

    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "20 dias"
        label.font = UIFont.mediumBodyBold
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "ProjectScheduleView.textLabel"

        return label
    }()

    // MARK: - Initilizer
    public init(
        projectIsComplete: Bool,
        projectDaysRemaining: Int
    ) {
        self.projectIsComplete = projectIsComplete
        self.projectDaysRemaining = projectDaysRemaining

        super.init(frame: .zero)

        configureSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews
    private func configureSubviews() {
        addSubview(mainView)

        mainView.addSubview(mainStackView)

        mainStackView.addArrangedSubview(iconHelperView)

        iconHelperView.addSubview(iconImageView)

        mainStackView.addArrangedSubview(textLabel)
    }

    @available(iOS 13.0, *)
    private func customizeSubviews() {
        if projectIsComplete {
            iconImageView.image = .pharusIcons.checkIcon?.withTintColor(.black)
            textLabel.text = "Feito!"
            mainView.backgroundColor = UIColor.ProjectSchedule.greenBackground
        } else {
            switch projectDaysRemaining {
            case ..<0:
                mainView.backgroundColor = .black
                textLabel.text = "Expirado"
                iconImageView.image = .pharusIcons.xmarkIcon?.withTintColor(.white)
            case 0...6:
                mainView.backgroundColor = UIColor.ProjectSchedule.redBackground
                iconImageView.image = .pharusIcons.clockIcon ?? .defaultImage
                textLabel.text = "\(projectDaysRemaining) Dias"
                textLabel.textColor = .white
                iconImageView.image = iconImageView.image?.withTintColor(.white)
            case 7...8:
                iconImageView.image = .pharusIcons.clockIcon ?? .defaultImage
                textLabel.text = "\(projectDaysRemaining) Dias"
                mainView.backgroundColor = UIColor.ProjectSchedule.yellowBackground
            default:
                iconImageView.image = .pharusIcons.clockIcon ?? .defaultImage
                textLabel.text = "\(projectDaysRemaining) Dias"
                mainView.backgroundColor = UIColor.ProjectSchedule.orangeBackground
            }
        }
    }

    // MARK: - Constraints
    private func setupConstraints() {
        // Main View
        self.stretch(mainView)

        // Main Stack View
        self.stretch(mainStackView, to: mainView, left: 10, right: -10)

        // Icon Helper View
        NSLayoutConstraint.activate([
            iconHelperView.widthAnchor.constraint(equalToConstant: 36)
        ])

        // Icon Image View
        iconImageView.center(in: iconHelperView)
        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: 36),
            iconImageView.widthAnchor.constraint(equalToConstant: 36)
        ])
    }
}