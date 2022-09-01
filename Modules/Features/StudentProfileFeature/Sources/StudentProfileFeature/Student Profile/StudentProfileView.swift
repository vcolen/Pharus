//
//  StudentProfileView.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 16/04/22.
//

import UIKit
import PharusUI
import CoreApp
import CoreKit

class StudentProfileView: UIView {

    // MARK: - Views
    private lazy var mainScrollView = VScrollView {
        VStackView([
            VStackView([
                profileImageView
            ])
            .frame(height: 120),

            VStackView([
                infoStackView
            ])
        ])
        .setting(\.spacing, to: 88)
        .padding(.top, 30)
        .padding(.bottom, 26)
        .frame(width: UIScreen.main.bounds.width)
    }

    lazy var profileImageView = UIImageView()
        .setting(\.image, to: CircleAvatarImages.avatar1)
        .setting(\.contentMode, to: .scaleAspectFit)
        .center(.allAxis)

    lazy var infoStackView = VStackView(spacing: 18, [])
        .setting(\.spacing, to: 40)
        .padding(.leading, 40)

    // MARK: - Initializer
    init() {
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
    }

    func setupConstraints() {
        mainScrollView.edges()
    }

    func applyAdditionalChanges() {
        showStudentAvatar()
        setupStudentInfo()
    }
}

// MARK: - Additional Methods
extension StudentProfileView {
    func showStudentAvatar(of student: Student? = nil) {
        guard let student = student else {
            profileImageView.originalView.image = UIImage(
                named: "avatar1" + PharusUIConstants.assets.images.avatar.circleImage.suffix
            )
            return
        }
        profileImageView.originalView.image = UIImage(
            named: "avatar" + student.avatar + PharusUIConstants.assets.images.avatar.circleImage.suffix
        )
    }

    func setupStudentInfo(of student: Student? = nil) {
        guard let student = student else {
            for _ in 0..<5 {
                infoStackView.originalView.addArrangedSubview(
                    VStackView([
                        UILabel()
                            .setting(\.text, to: "XXXXXXXXXX")
                            .setting(\.textColor, to: .white)
                            .setting(\.font, to: .mediumTitleBold),

                        UILabel()
                            .setting(\.text, to: "xxxxxxxxxx")
                            .setting(\.textColor, to: .white)
                            .setting(\.font, to: .smallBody)
                    ])
                )
            }
            return
        }

        infoStackView.originalView.removeFullyAllArrangedSubviews()

        var studentInfo: KeyValuePairs<String, String> {[
            "Nome": "\(student.firstName) \(student.lastName)",
            "E-mail": student.email,
            "Escola": student.school,
            "Período Escolar": student.year,
            "Cidade": student.city
        ]}

        studentInfo.forEach { info in
            infoStackView.originalView.addArrangedSubview(
                VStackView([
                    UILabel()
                        .setting(\.text, to: info.key)
                        .setting(\.textColor, to: .white)
                        .setting(\.font, to: .mediumTitleBold),

                    UILabel()
                        .setting(\.text, to: info.value)
                        .setting(\.textColor, to: .white)
                        .setting(\.font, to: .smallBody)
                ])
            )
        }
    }

    func updateView(with student: Student) {
        showStudentAvatar(of: student)
        setupStudentInfo(of: student)
    }
}
