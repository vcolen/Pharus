//
//  ProjectRulesView.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//

import UIKit
import PharusUI

class ProjectSheetView: UIView {

    // MARK: - Properties
    weak var delegate: ProjectSheetViewDelegate?

    private var project: ProjectModel
    private var sheetContent: SheetContent

    enum SheetContent {
        case activities
        case mentorReview
    }

    // MARK: - Views
    private lazy var scrollView = VScrollView {
        VStackView([
            VStackView([
                HStackView([
                    titleIconImageView,
                    titleLabel
                ])
                .setting(\.spacing, to: 8)
                .center(.allAxis)
            ])
            .frame(height: 60),

            VStackView([
                UILabel()
                    .setting(\.font, to: .mediumTitleBold)
                    .setting(\.numberOfLines, to: 0)
                    .setting(\.textColor, to: .black),

                descriptionTextLabel
            ])
            .setting(\.spacing, to: 16),

            closeButton
        ])
        .setting(\.spacing, to: 46)
        .padding([.leading, .trailing], 25)
        .padding(.top, 32)
        .padding(.bottom, 24)
    }
    .setting(\.backgroundColor, to: .Modal.yellowBackground)
    .setting(\.layer.cornerRadius, to: 16)

    private lazy var titleIconImageView = UIImageView()
        .setting(\.image, to: .pharusIcons.feedbackIcon)
        .frame(width: 48, height: 48)

    private lazy var titleLabel = UILabel()
        .setting(\.font, to: .largeTitleBold)
        .setting(\.textColor, to: .black)

    private lazy var descriptionTextLabel = UILabel()
        .setting(\.numberOfLines, to: 0)
        .setting(\.textColor, to: .black)
        .setting(\.font, to: .smallBody)

    private lazy var closeButton = MainCardButton(title: "Fechar", buttonState: .normal)

    // MARK: - Initializer
    init(
        project: ProjectModel,
        sheetContent: SheetContent
    ) {
        self.project = project
        self.sheetContent = sheetContent

        super.init(frame: .zero)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Codable
extension ProjectSheetView: ViewCodable {
    func buildHierarchy() {
        addSubview(scrollView)
    }

    func setupConstraints() {
        scrollView.edges()
    }

    func applyAdditionalChanges() {
        setupSheetContent()
        setupCloseButton()
    }
}

// MARK: - Delegate Actions
extension ProjectSheetView {
    func closeButtonTapped() {
        delegate?.closeButtonTapped()
    }
}

// MARK: - Additional Methods
extension ProjectSheetView {
    private func setupSheetContent() {
        if sheetContent == .mentorReview {
            titleIconImageView.image = .pharusIcons.feedbackIcon
            titleLabel.text = "Avaliação do Mentor"
            descriptionTextLabel.text = project.scoreDescription
        } else {
            titleIconImageView.image = .pharusIcons.rulesIcon
            titleLabel.text = "Atividades"
            var descriptionText = ""
            for task in project.tasks {
                descriptionText += "\(task.title) - \(task.taskDescription)\n\n"
            }
            descriptionTextLabel.text = descriptionText
        }
    }

    private func setupCloseButton() {
        closeButton.setTitle("Fechar", for: .normal)
        closeButton.addAction(UIAction { [weak self] _ in
            self?.closeButtonTapped()
        }, for: .touchUpInside)
    }
}
