//
//  StudentHomeViewController.swift
//  Pharus
//
//  Created by Victor Colen on 11/04/22.
//
import UIKit

class StudentHomeViewController: UIViewController {

    // MARK: - Properties

    private let presenter: StudentHomePresenter
    private var pageController: UIPageViewController?
    private let currentIndex: Int
    private let pages: [Pages] = Pages.allCases
    private let customView: StudentHomeView

    // MARK: - Initializer

    init(
        presenter: StudentHomePresenter
    ) {
        self.presenter = presenter
        self.currentIndex = 0
        self.customView = StudentHomeView(studentName: presenter.student.firstName)

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

    override func loadView() {
        super.loadView()

        self.view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBarIcons()
        setupPageController()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setGradientBackground()
        showStudentAvatar()
    }

    // MARK: - Actions

    func showStudentAvatar() {
        customView.studentAvatarImageView.image = UIImage(
            named: "avatar" + presenter.student.avatar + Constants.assets.images.avatar.circleImage.suffix
        )
    }

    func setupTabBarIcons() {
        let array = self.tabBarController?.customizableViewControllers
        for controller in array! {
            controller.tabBarItem.imageInsets = UIEdgeInsets(
                top: 3,
                left: 0,
                bottom: -3,
                right: 0
            )
        }
    }

    private func setupPageController() {
        self.pageController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )

        self.pageController?.dataSource = self
        self.customView.newsHelperView.addSubview(self.pageController!.view)
        self.view.stretch(self.pageController!.view, to: customView.newsHelperView, left: 16, right: -16)
        let initialVC = HomeNewsViewController(with: pages[0])
        self.pageController?.setViewControllers([initialVC], direction: .forward, animated: true)
        self.pageController?.didMove(toParent: self)
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
            return HomeNewsView()
        case .pageOne:
            return HomeNewsView(
                news: Constants.defaultTexts.homeNewsText
            )
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
