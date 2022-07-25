//
//  SendFileView.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//

import UIKit
import PharusUI

class SendFileView: UIView {

    // MARK: - Properties
    weak var delegate: SendFileViewDelegate?

    // MARK: - Views
    private lazy var mainStackView = VStackView([
        titleStackView,
        descriptionLabel,
        uploadFileHelperView,
        fileHelperView,
        sendFileButton,
        UIView()
    ])
        .setting(\.spacing, to: 30)
        .padding([.top], 38)
        .padding([.leading, .trailing], 25)
        .setting(\.backgroundColor, to: .Modal.yellowBackground)
        .setting(\.translatesAutoresizingMaskIntoConstraints, to: false)

    private lazy var titleStackView = HStackView([
        titleHelperView,
        closeSheetButton
    ])

    private lazy var titleHelperView = VStackView([
        titleLabel
    ])

    private lazy var titleLabel = UILabel()
        .setting(\.text, to: "Enviar arquivos")
        .setting(\.font, to: .largeTitleBold)
        .setting(\.textColor, to: .black)
        .setting(\.textAlignment, to: .center)

    lazy var closeSheetButton = UIButton()
        .frame(width: 24, height: 24)

    private lazy var descriptionLabel = UILabel()
        .setting(\.numberOfLines, to: 0)
        .setting(\.text, to: Constants.defaultTexts.sendFileText)
        .setting(\.textColor, to: .black)
        .setting(\.font, to: .smallBody)

    private lazy var uploadFileHelperView = VStackView([
        uploadFileStackView
    ])
        .setting(\.backgroundColor, to: .Modal.orangeBackground)
        .setting(\.layer.cornerRadius, to: 8)
        .frame(height: 118)

    private lazy var uploadFileStackView = VStackView([
        uploadIconHelperView,
        uploadMessageLabel
    ])
        .setting(\.spacing, to: 3)

    private lazy var uploadIconHelperView = VStackView([
        uploadIconImageView
    ])
        .frame(height: 50)

    private lazy var uploadIconImageView = UIImageView()
        .setting(\.image, to: .pharusIcons.uploadIcon)
        .frame(height: 43)
        .center(.allAxis)

    private lazy var uploadMessageLabel = UILabel()
        .setting(\.text, to: "Selecione os arquivos para enviar")
        .setting(\.textAlignment, to: .center)
        .setting(\.numberOfLines, to: 0)
        .setting(\.font, to: .smallBody)
        .setting(\.textColor, to: .black)

    private lazy var fileHelperView = VStackView([
        fileStackView
    ])
        .setting(\.backgroundColor, to: .white)
        .setting(\.layer.cornerRadius, to: 8)
        .frame(height: 45)

    private lazy var fileStackView = HStackView([
        fileImageView,
        fileNameLabel,
        removeFileButton
    ])
        .setting(\.spacing, to: 14)
        .padding([.top, .leading, .trailing, .bottom], 9)

    private lazy var fileImageView = UIImageView()
        .setting(\.image, to: .pharusIcons.bookIcon)
        .frame(width: 28)

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
        closeSheetButton.setImage(UIImage.pharusIcons.xmarkIcon, for: .normal)
        closeSheetButton.addAction(
            UIAction { [weak self] _ in
                self?.closeButtonTapped()
            },
            for: .touchUpInside
        )

        uploadFileStackView.setOnClickListener { [weak self] in
            self?.uploadButtonTapped()
        }

        removeFileButton.setImage(UIImage.pharusIcons.xmarkIcon, for: .normal)

        sendFileButton.addAction(UIAction { [weak self] _ in
            self?.sendFileButtonTapped()
        }, for: .touchUpInside)

        sendFileButton.disable()
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
