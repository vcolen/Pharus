//
//  StudentProjectsRankingViewController.swift
//  Pharus
//
//  Created by Victor Colen on 04/04/22.
//
import UIKit

class StudentProjectsRankingViewController: UIViewController {

    // MARK: - Properties
    private lazy var customView = StudentProjectsRankingView(student: presenter.student)
    private let presenter: StudentProjectsRankingPresenting

    // MARK: - Initializer
    init(presenter: StudentProjectsRankingPresenting) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)

        presenter.attach(self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Actions
    private func setNavigationBar() {
        self.title = "Seus Rankings"
        self.navigationController?.title = ""
    }
}

// MARK: - Super Methods
extension StudentProjectsRankingViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()

        view = customView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setGradientBackground()
    }
}

// MARK: - Student Projects Ranking Viewable
extension StudentProjectsRankingViewController: StudentProjectsRankingViewable { }

// MARK: - Student Projects Ranking View Delegate
extension StudentProjectsRankingViewController: StudentProjectsRankingViewDelegate { }
