//
//  SendFileView.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//

import UIKit
import PharusUI

class SendFileView: UIView {

    #warning("implementar constante na linha 34")
    // MARK: - Properties
    weak var delegate: SendFileViewDelegate?

    // MARK: - Views
    private lazy var mainStackView = VStackView([
        HStackView([
            VStackView([
                UILabel()
                    .setting(\.text, to: "Enviar arquivos")
                    .setting(\.font, to: .largeTitleBold)
                    .setting(\.textColor, to: .black)
                    .setting(\.textAlignment, to: .center)
            ]),

            closeSheetButton
        ]),

        UILabel()
            .setting(\.numberOfLines, to: 0)
            .setting(\.text, to: "enviar arquivo")
            .setting(\.textColor, to: .black)
            .setting(\.font, to: .smallBody),

        VStackView([
            uploadFileStackView
        ])
        .setting(\.backgroundColor, to: .Modal.orangeBackground)
        .setting(\.layer.cornerRadius, to: 8)
        .frame(height: 118),

        VStackView([
            fileStackView
        ])
        .setting(\.backgroundColor, to: .white)
        .setting(\.layer.cornerRadius, to: 8)
        .frame(height: 45),

        sendFileButton,
        UIView()
    ])
    .setting(\.spacing, to: 30)
    .padding(.top, 38)
    .padding([.leading, .trailing], 25)
    .setting(\.backgroundColor, to: .Modal.yellowBackground)

    lazy var closeSheetButton = UIButton()
        .frame(width: 24, height: 24)

    private lazy var uploadFileStackView = VStackView([
        VStackView([
            UIImageView()
                .setting(\.image, to: .pharusIcons.uploadIcon)
                .frame(height: 43)
                .center(.allAxis)
        ])
        .frame(height: 50),

        UILabel()
            .setting(\.text, to: "Selecione os arquivos para enviar")
            .setting(\.textAlignment, to: .center)
            .setting(\.numberOfLines, to: 0)
            .setting(\.font, to: .smallBody)
            .setting(\.textColor, to: .black)
    ])
    .setting(\.spacing, to: 3)

    private lazy var fileStackView = HStackView([
        UIImageView()
            .setting(\.image, to: .pharusIcons.bookIcon)
            .frame(width: 28),

        fileNameLabel,
        removeFileButton
    ])
    .setting(\.spacing, to: 14)
    .padding(.all, 9)

    lazy var fileNameLabel = UILabel()
        .setting(\.text, to: "")
        .setting(\.textColor, to: .black)

    private lazy var removeFileButton = UIButton()
        .setting(\.tintColor, to: .black)
        .frame(width: 18)

    lazy var sendFileButton = MainCardButton(title: "Enviar Arquivos", buttonState: .normal)

    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Codable
extension SendFileView: ViewCodable {
    func buildHierarchy() {
        addSubview(mainStackView)
    }

    func setupConstraints() {
        mainStackView.edges()
    }

    func applyAdditionalChanges() {
        setupButtons()
        uploadFileStackView.setOnClickListener { [weak self] in
            self?.uploadButtonTapped()
        }
    }
}

// MARK: - Delegate Actions
extension SendFileView {
    func closeButtonTapped() {
        delegate?.closeButtonTapped()
    }

    func uploadButtonTapped() {
        delegate?.uploadButtonTapped()
    }

    func sendFileButtonTapped() {
        delegate?.sendFileButtonTapped()
    }
}

// MARK: - Additional Methods
extension SendFileView {
    private func setupButtons() {
        setupSendFileButton()
        setupCloseSheetButton()
        removeFileButton.setImage(UIImage.pharusIcons.xmarkIcon, for: .normal)
    }

    private func setupSendFileButton() {
        sendFileButton.addAction(UIAction { [weak self] _ in
            self?.sendFileButtonTapped()
        }, for: .touchUpInside)

        sendFileButton.disable()
    }

    private func setupCloseSheetButton() {
        closeSheetButton.setImage(UIImage.pharusIcons.xmarkIcon, for: .normal)
        closeSheetButton.addAction(
            UIAction { [weak self] _ in
                self?.closeButtonTapped()
            },
            for: .touchUpInside
        )
    }
}
