//
//  StudentProfileView.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 16/04/22.
//

import UIKit

class StudentProfileView: UIView {

    // MARK: - Properties
    private let student: StudentModel

    // MARK: - Views
    private lazy var mainScrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.accessibilityIdentifier = "StudentProfileView.mainScrollView"

        return scrollView
    }()

    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProfileView.mainView"

        return view
    }()

    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 88
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProfileView.mainStackView"

        return stackView
    }()

    private lazy var profileImageHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProfileView.profileImageHelperView"

        return view
    }()

    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = CircleAvatarImages.avatar1
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "StudentProfileView.profileImageView"

        return imageView
    }()

    private lazy var infoHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProfileView.infoHelperView"

        return view
    }()

    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProfileView.infoStackView"

        return stackView
    }()

    // MARK: - Initializer
    init(student: StudentModel) {
        self.student = student

        super.init(frame: .zero)

        configureSubviews(with: student)
        setupConstraints()
        showStudentAvatar()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews

    func showStudentAvatar() {
        profileImageView.image = UIImage(
            named: "avatar" + student.avatar + Constants.assets.images.avatar.circleImage.suffix
        )
    }

    func configureSubviews(with student: StudentModel) {
        addSubview(mainScrollView)

        mainScrollView.addSubview(mainStackView)

        mainStackView.addArrangedSubview(profileImageHelperView)

        profileImageHelperView.addSubview(profileImageView)

        mainStackView.addArrangedSubview(infoHelperView)

        infoHelperView.addSubview(infoStackView)

        let studentInfo: KeyValuePairs<String, String> = [
            "Nome": "\(student.firstName) \(student.lastName)",
            "E-mail": student.email,
            "Escola": student.school,
            "Período Escolar": student.year,
            "Cidade": student.city
        ]

        for info in studentInfo {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 18

            let infoKeyLabel = UILabel()
            infoKeyLabel.text = info.key
            infoKeyLabel.textColor = .white
            infoKeyLabel.font = .mediumTitleBold

            let infoValueLabel = UILabel()
            infoValueLabel.text = info.value
            infoValueLabel.textColor = .white
            infoValueLabel.font = .smallBody

            stackView.addArrangedSubview(infoKeyLabel)
            stackView.addArrangedSubview(infoValueLabel)

            infoStackView.addArrangedSubview(stackView)
        }
    }

    // MARK: - Constraints

    func setupConstraints() {
        // Main Scroll View
        self.stretch(mainScrollView)

        // Main Stack View
        self.stretch(mainStackView, to: mainScrollView, top: 30, bottom: -26)
        NSLayoutConstraint.activate([
            mainStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])

        // Info Helper View
        NSLayoutConstraint.activate([
            infoHelperView.heightAnchor.constraint(equalToConstant: 480)
        ])

        // Info Stack View
        NSLayoutConstraint.activate([
            infoStackView.leadingAnchor.constraint(equalTo: infoHelperView.leadingAnchor, constant: 40)
        ])

        // Profile Image Helper View
        NSLayoutConstraint.activate([
            profileImageHelperView.heightAnchor.constraint(equalToConstant: 150)
        ])

        // Profile Image View
        profileImageView.center(in: profileImageHelperView)
        NSLayoutConstraint.activate([
            profileImageView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
}