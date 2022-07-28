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
        VStackView([
            VStackView([
                profileImageView
            ])
            .frame(height: 120),

            VStackView([
                VStackView(spacing: 18, studentInfo.map { info in
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
                })
                .setting(\.spacing, to: 40)
                .padding([.leading], 40)
            ])
        ])
        .setting(\.spacing, to: 88)
        .padding([.top], 30)
        .padding([.bottom], 26)
        .frame(width: UIScreen.main.bounds.width)
    }

    lazy var profileImageView = UIImageView()
        .setting(\.image, to: CircleAvatarImages.avatar1)
        .setting(\.contentMode, to: .scaleAspectFit)
        .center(.allAxis)

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

    var studentInfo: KeyValuePairs<String, String> {
        [
            "Nome": "\(student.firstName) \(student.lastName)",
            "E-mail": student.email,
            "Escola": student.school,
            "Período Escolar": student.year,
            "Cidade": student.city
        ]
    }
}
