//
//  ProjectRulesViewController.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//

import UIKit

class ProjectSheetViewController: UIViewController {

    // MARK: - Properties
    private let presenter: ProjectSheetPresenter
    private let projectSheetView: ProjectSheetView

    // MARK: - Initializer
    init(presenter: ProjectSheetPresenter
    ) {
        self.presenter = presenter
        self.projectSheetView = ProjectSheetView(
            project: presenter.project,
            sheetContent: presenter.projectSheetContent
        )

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Super Methods
extension ProjectSheetViewController {
    override func loadView() {
        super.loadView()

        self.view = projectSheetView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        projectSheetView.delegate = self
    }
}

// MARK: - Project Sheet View Delegate
extension ProjectSheetViewController: ProjectSheetViewDelegate {
    func closeButtonTapped() {
        presenter.popView()
    }
}

// MARK: - Project Sheet Viewable
extension ProjectSheetViewController: ProjectSheetViewable { }
