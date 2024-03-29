//
//  StudentHomeViewController.swift
//  Pharus
//
//  Created by Victor Colen on 11/04/22.
//
import UIKit
import PharusUI

class StudentHomeViewController: UIViewController {

    // MARK: - Properties
    private var pageController: UIPageViewController?
    private let currentIndex: Int
    private let pages: [Pages] = Pages.allCases
    private let presenter: StudentHomePresenting
    private lazy var customView = StudentHomeView(student: presenter.student)

    // MARK: - Initializer
    init(presenter: StudentHomePresenting) {
        self.presenter = presenter
        self.currentIndex = 0

        super.init(nibName: nil, bundle: nil)

        presenter.attach(self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Actions
    private func setupPageController() {
        pageController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )

        guard let pageController = pageController else {
            return
        }

        pageController.dataSource = self
        customView.newsHelperView.addSubview(pageController.view)
        view.stretch(
            pageController.view,
            to: customView.newsHelperView,
            left: 16,
            right: -16
        )

        let initialVC = HomeNewsViewController(with: pages[0])
        pageController.setViewControllers(
            [initialVC],
            direction: .forward,
            animated: true
        )

        pageController.didMove(toParent: self)
    }
}

// MARK: - Super Methods
extension StudentHomeViewController {
    override func loadView() {
        self.view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupPageController()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setGradientBackground()
        presenter.loadData()
        customView.student = presenter.student
        customView.showStudentAvatar()
    }
}

// MARK: - UIPageViewControllerDataSource
extension StudentHomeViewController: UIPageViewControllerDataSource {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        guard let currentVC = viewController as? HomeNewsViewController else {
            return nil
        }
        var index = currentVC.page.index
        if index == 0 {
            return nil
        }
        index -= 1
        let viewController: HomeNewsViewController = HomeNewsViewController(with: pages[index])
        return viewController
    }

    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        guard let currentVC = viewController as? HomeNewsViewController else {
            return nil
        }
        var index = currentVC.page.index
        if index >= self.pages.count - 1 {
            return nil
        }
        index += 1
        let viewController: HomeNewsViewController = HomeNewsViewController(with: pages[index])
        return viewController
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.pages.count
    }
}

// MARK: - Student Home View Delegate
extension StudentHomeViewController: StudentHomeViewDelegate { }

// MARK: - Student Home Viewable
extension StudentHomeViewController: StudentHomeViewable { }

// MARK: - Pages
enum Pages: CaseIterable {
    case pageZero
    case pageOne

    var view: UIView {
        switch self {
        case .pageZero:
            return HomeNewsView(news: Constants.defaultTexts.pageZeroText)
        case .pageOne:
            return HomeNewsView(news: Constants.defaultTexts.pageOneText)
        }
    }

    var index: Int {
        switch self {
        case .pageZero:
            return 0
        case .pageOne:
            return 1
        }
    }
}
