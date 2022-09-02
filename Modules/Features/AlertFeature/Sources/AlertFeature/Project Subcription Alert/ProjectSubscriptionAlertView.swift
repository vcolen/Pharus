//
//  ProjectSubscriptionAlertView.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit
import PharusUI
import CoreKit

class ProjectSubscriptionAlertView: UIView {

    // MARK: - Properties
    weak var delegate: ProjectSubscriptionAlertViewDelegate?

    // MARK: - Views
    private lazy var mainStackView = VStackView([
        HStackView([
            UILabel()
                .setting(\.font, to: .largeTitleSemiBold)
                .setting(\.text, to: "Confirmar Inscrição")
                .setting(\.textColor, to: .black),
            closeModalButton
        ]),

        descriptionLabel,
        primaryButton,
        secondaryButton
    ])
    .setting(\.spacing, to: 24)
    .padding(.top, 32)
    .padding([.leading, .bottom], 16)
    .padding(.trailing, 13)
    .setting(\.backgroundColor, to: .Modal.yellowBackground)
    .setting(\.layer.cornerRadius, to: 16)
    .padding([.leading, .trailing], 16)
    .frame(height: 314)
    .center(.vertically)
    .background(UIVisualEffectView(effect: UIBlurEffect(style: .light)))

    private lazy var closeModalButton = UIButton()
        .frame(width: 24, height: 24)

    private lazy var descriptionLabel = UILabel()
        .setting(\.font, to: .mediumBody)
        .setting(\.text, to: "Você deseja se inscrever no projeto \"Algoritmo no seu dia?\"")
        .setting(\.numberOfLines, to: 2)
        .setting(\.textColor, to: .black)

    private lazy var primaryButton = MainCardButton(
        title: "Sim, quero me inscrever",
        buttonState: .normal
    )

    private lazy var secondaryButton = SecondaryCardButton(title: "Não quero, mudei de ideia")

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
extension ProjectSubscriptionAlertView: ViewCodable {
    func buildHierarchy() {
        addSubview(mainStackView)
    }

    func setupConstraints() {
        mainStackView.edges()
    }

    func applyAdditionalChanges() {
        setupButtons()
    }
}

// MARK: - Delegate Actions
extension ProjectSubscriptionAlertView {

    func closeButtonTapped() {
        delegate?.closeButtonTapped()
    }
    func primaryButtonTapped() {
        delegate?.primaryButtonTapped()
    }

    func secondaryButtonTapped() {
        delegate?.secondaryButtonTapped()
    }
}

// MARK: - Additional Methods
extension ProjectSubscriptionAlertView {
    private func setupButtons() {
        setupPrimaryButton()
        setupSecondaryButton()
        setupCloseButton()
    }

    private func setupPrimaryButton() {
        primaryButton.addAction(UIAction { [weak self] _ in
            self?.primaryButtonTapped()
        }, for: .touchUpInside)
    }

    private func setupSecondaryButton() {
        secondaryButton.addAction( UIAction { [weak self] _ in
            self?.secondaryButtonTapped()
        }, for: .touchUpInside)
    }

    private func setupCloseButton() {
        closeModalButton.setImage(UIImage.pharusIcons.xmarkIcon, for: .normal)
        closeModalButton.addAction(UIAction { [weak self] _ in
            self?.closeButtonTapped()
        }, for: .touchUpInside)
    }

    func updateView(with project: Project) {
        descriptionLabel.text = "Você deseja se inscrever no projeto \"\(project.name)?\""
    }
}
