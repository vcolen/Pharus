//
//  StudentProfileView.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 16/04/22.
//

import UIKit
import PharusUI

class StudentProfileView: UIView {

    // MARK: - Properties
    var student: StudentModel

    // MARK: - Views
    private lazy var mainScrollView = VScrollView {
        mainStackView
    }

    private lazy var mainStackView = VStackView([
        profileImageHelperView,
        infoHelperView
    ])
    .setting(\.spacing, to: 88)
    .padding([.top], 30)
    .padding([.bottom], 26)
    .frame(width: UIScreen.main.bounds.width)

    private lazy var profileImageHelperView = VStackView([
        profileImageView
    ])
    .frame(height: 120)

    lazy var profileImageView = UIImageView()
        .setting(\.image, to: CircleAvatarImages.avatar1)
        .setting(\.contentMode, to: .scaleAspectFit)
        .center(.allAxis)

    private lazy var infoHelperView = VStackView([
        infoStackView
    ])
    .frame(height: 480)

    private lazy var infoStackView = VStackView([])
        .setting(\.spacing, to: 40)
        .padding([.leading], 40)

    // MARK: - Initializer
    init(student: StudentModel) {
        self.student = student

        super.init(frame: .zero)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Codable
extension StudentProfileView: ViewCodable {
    func buildHierarchy() {
        addSubview(mainScrollView)
        buildInfoView()
    }

    func setupConstraints() {
        mainScrollView.edges()
    }
}

// MARK: - Additional Methods
extension StudentProfileView {
    func showStudentAvatar() {
        profileImageView.originalView.image = UIImage(
            named: "avatar" + student.avatar + PharusUIConstants.assets.images.avatar.circleImage.suffix
        )
    }

    func buildInfoView() {
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

            infoStackView.originalView.addArrangedSubview(stackView)
        }
    }
}
