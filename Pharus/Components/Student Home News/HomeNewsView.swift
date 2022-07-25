//
//  HomeNewsView.swift.swift
//  Pharus
//
//  Created by Victor Colen on 13/04/22.
//

import UIKit
import PharusUI

class HomeNewsView: UIView {

    // MARK: - Properties
    private var news: String

    // MARK: - Views
    private lazy var mainStackView = VStackView([
        titleHelperView,
        descriptionHelperView
    ])
        .setting(\.spacing, to: 10)
        .padding([.top, .bottom], 17)
        .padding([.leading, .trailing], 16)
        .setting(\.backgroundColor, to: .white)
        .setting(\.layer.cornerRadius, to: 16)

    private lazy var titleHelperView = VStackView([
        titleLabel
    ])
        .frame(height: 24)

    private lazy var titleLabel = UILabel()
        .setting(\.text, to: "Fique por dentro!")
        .setting(\.font, to: .largeTitleBold)
        .setting(\.textColor, to: .black)
        .setting(\.textAlignment, to: .center)

    private lazy var descriptionHelperView = VStackView([
        descriptionLabel
    ])

    private lazy var descriptionLabel = UILabel()
        .setting(\.numberOfLines, to: 0)
        .setting(\.textColor, to: .black)
        .setting(\.font, to: .smallBody)
        .setting(\.textAlignment, to: .justified)
        .setting(\.text, to: Constants.defaultTexts.pageZeroText)

    // MARK: - Initializer
    init(news: String) {
        self.news = news

        super.init(frame: .zero)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Codable
extension HomeNewsView: ViewCodable {
    func buildHierarchy() {
        addSubview(mainStackView)
    }

    func setupConstraints() {
        mainStackView.edges()
        NSLayoutConstraint.activate([
            mainStackView.widthAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.width)
        ])
    }

    func applyAdditionalChanges() {
        self.descriptionLabel.text = news
    }
}
