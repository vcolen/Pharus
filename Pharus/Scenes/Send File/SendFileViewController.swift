//
//  SendFileViewController.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 06/04/22.
//

import UIKit
import UniformTypeIdentifiers

class SendFileViewController: UIViewController, UIDocumentPickerDelegate {

    // MARK: - Properties
    private lazy var sendFileView = SendFileView()
    private let presenter: SendFilePresenting

    // MARK: - Initializer
    init(presenter: SendFilePresenting) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)

        presenter.attach(self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Super Methods
extension SendFileViewController {
    override func loadView() {
        self.view = sendFileView
    }

    override func viewDidLoad() {
        sendFileView.delegate = self
    }
}

// MARK: - Send File Delegate
extension SendFileViewController: SendFileViewDelegate {
    func closeButtonTapped() {
        presenter.closeSheet()
    }

    func uploadButtonTapped() {
        let suportFiles: [UTType] = [
            .pdf,
            .data,
            .jpeg
        ]

        let controller = UIDocumentPickerViewController(
            forOpeningContentTypes: suportFiles,
            asCopy: true
        )

        controller.delegate = self
        controller.allowsMultipleSelection = false
        present(controller, animated: true, completion: nil)
    }

    func documentPicker(
        _ controller: UIDocumentPickerViewController,
        didPickDocumentsAt urls: [URL]
    ) {
        if let filename = urls.first?.lastPathComponent {
            sendFileView.fileNameLabel.text = filename
            sendFileView.sendFileButton.enable()
        }
    }

    func sendFileButtonTapped() {
        presenter.sendFile()
    }
}

// MARK: - Send File Viewable
extension SendFileViewController: SendFileViewable { }
