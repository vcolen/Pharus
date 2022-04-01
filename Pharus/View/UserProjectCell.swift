//
//  UserProjectCell.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import UIKit

class UserProjectCell: UITableViewCell {
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "UserProjectCell.mainView"
        
        return view
    }()
    
    lazy var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "UserProjectCell.titleStackView"
        
        return stackView
    }()
    
    lazy var descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "UserProejctCell.descriptionStackView"
        
        return stackView
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 7
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "UserProjectCell.mainStackView"
        
        return stackView
    }()
    
    lazy var progressStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "UserProjectCell.progressStackView"
        
        return stackView
    }()
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "UserProjectCell.titleLabel"
        
        return label
    }()
    
    lazy var mentor: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "UserProjectCell.mentorsLabel"
        
        return label
    }()
    
    lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Descrição:"
        label.font = .boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "UserProjectCell.descriptionTitleLabel"
        
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "UserProjectCell.descriptionLabel"
        
        return label
    }()
    
    lazy var completionStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .center
        stackview.spacing = 26
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.accessibilityIdentifier = "UserProjectCell.helpImageView"
        
        return stackview
    }()
    
    lazy var completionCircleHelpView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "UserProjectCell.completionCircleHelpView"
        
        return view
    }()
    
    lazy var completionBarCircleView: CircleView = {
        let view = CircleView()
        view.trackColor = UIColor(red: 0.765, green: 0.765, blue: 0.765, alpha: 1)
        view.progressColor = UIColor(red: 0.153, green: 0.153, blue: 0.153, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "UserProjectCell.descriptionTitleLabel"
        
        return view
    }()
    
    lazy var percentageCompletionLabel: UILabel = {
        let label = UILabel()
        label.text = "100%"
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "UserProjectCell.percentageCompletionLabel"
        
        return label
    }()
    
    lazy var daysRemainingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 11.67
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "UserProjectCell.daysRemainingStackView"
        
        return stackView
    }()
    
    lazy var daysRemainingLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.text = "8 dias"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "UserProjectCell.daysRemainingLabel"
        
        return label
    }()
    
    lazy var inspirationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: K.AssetsNames.inspiration)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "UserProjectCell.inspirationImageView"
        return imageView
    }()
    
    lazy var partnershipStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "UserProjectCell.partnershipStackView"
        
        return stackView
    }()
    
    lazy var partnershipLabel: UILabel = {
        let label = UILabel()
        label.text = "Realizado em parceria com"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "UserProjectCell.partnershipLabel"
        
        return label
    }()
    
    lazy var companyLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: K.AssetsNames.companyLogo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "UserProjectCell.companyLogoImageView"
        
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(project: Project) {
        self.titleLabel.text = project.name
        self.descriptionLabel.text = project.projectDescription
        self.mentor.text = "Mentor: " + project.mentor
        self.completionBarCircleView.percentage = Double(project.completionStatus)
        self.percentageCompletionLabel.text = String(project.completionStatus) + "%"
        
    }
    
    func configureSubviews() {
        addSubview(mainView)
        
        mainView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(titleStackView)
        
        titleStackView.addArrangedSubview(titleLabel)
        
        mainStackView.addArrangedSubview(mentor)
        mainStackView.addArrangedSubview(descriptionTitleLabel)
        mainStackView.addArrangedSubview(descriptionStackView)
        
        descriptionStackView.addArrangedSubview(descriptionLabel)
        descriptionStackView.addArrangedSubview(completionStackView)
        
        completionStackView.addArrangedSubview(completionCircleHelpView)
        
        completionCircleHelpView.addSubview(completionBarCircleView)
        completionCircleHelpView.addSubview(percentageCompletionLabel)
        
        //completionStackView.addArrangedSubview(percentageCompletionLabel)
        completionStackView.addArrangedSubview(daysRemainingStackView)
        
        daysRemainingStackView.addArrangedSubview(inspirationImageView)
        daysRemainingStackView.addArrangedSubview(daysRemainingLabel)
        
        mainStackView.addArrangedSubview(partnershipStackView)
        
        partnershipStackView.addArrangedSubview(partnershipLabel)
        partnershipStackView.addArrangedSubview(companyLogoImageView)
        
        completionStackView.addSubview(completionBarCircleView)
        
        mainView.backgroundColor = .cardColor
    }
    
    func setupConstraints() {
        
        //Main View
        self.stretch(mainView, top: 16, left: 16, bottom: -16, right: -16)
        
        //Main Stack View
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 8),
            mainStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -8),
            mainStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 24.5),
            mainStackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -8)
        ])
        
        //Mentors Label
        NSLayoutConstraint.activate([
            mentor.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor)
        ])
        
        //help
        NSLayoutConstraint.activate([
            completionStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
        ])
        
        //Description Stack View
        NSLayoutConstraint.activate([
            descriptionStackView.heightAnchor.constraint(equalToConstant: 144)
        ])
        
        //Company Logo Image View
        NSLayoutConstraint.activate([
            companyLogoImageView.widthAnchor.constraint(equalToConstant: 66),
            companyLogoImageView.heightAnchor.constraint(equalToConstant: 66)
        ])
        
        //Percentage Completion Label
        NSLayoutConstraint.activate([
            percentageCompletionLabel.centerXAnchor.constraint(equalTo: completionCircleHelpView.centerXAnchor),
            percentageCompletionLabel.centerYAnchor.constraint(equalTo: completionCircleHelpView.centerYAnchor),
        ])
        
        //Completion Bar Circle View
        NSLayoutConstraint.activate([
            completionBarCircleView.centerXAnchor.constraint(equalTo: completionCircleHelpView.centerXAnchor),
            completionBarCircleView.centerYAnchor.constraint(equalTo: completionCircleHelpView.centerYAnchor),
        ])
        
        //Inspiration Image View
        NSLayoutConstraint.activate([
            inspirationImageView.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
}
