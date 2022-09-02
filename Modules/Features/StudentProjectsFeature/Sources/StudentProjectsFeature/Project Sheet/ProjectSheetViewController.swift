//
//  ProjectRulesViewController.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//

import UIKit
import CoreKit

class ProjectSheetViewController: UIViewController {

    // MARK: - Properties
    private let presenter: ProjectSheetPresenting
    private lazy var projectSheetView = ProjectSheetView(
        sheetContent: presenter.projectSheetContent
    )

    // MARK: - Initializer
    init(presenter: ProjectSheetPresenting) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)

        presenter.attach(self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Super Methods
extension ProjectSheetViewController {
    override func loadView() {
        self.view = projectSheetView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        projectSheetView.delegate = self
        presenter.loadData()
    }
}

// MARK: - Project Sheet View Delegate
extension ProjectSheetViewController: ProjectSheetViewDelegate {
    func closeButtonTapped() {
        presenter.popView()
    }
}

// MARK: - Project Sheet Viewable
extension ProjectSheetViewController: ProjectSheetViewable {
    func updateView(with project: Project) {
        projectSheetView.updateView(with: project)
    }
}
