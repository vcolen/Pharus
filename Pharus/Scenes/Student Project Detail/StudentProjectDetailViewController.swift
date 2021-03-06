//
//  StudentProjectDetailViewController.swift
//  Pharus
//
//  Created by Victor Colen on 05/04/22.
//
import UIKit

class StudentProjectDetailViewController: UIViewController {
    
    //MARK: - Properties
    
    private var project: ProjectModel
    private var presenter: StudentProjectDetailPresenter
    private var coordinator: StudentProjectDetailCoordinator
    private var studentProjectDetailView: StudentProjectDetailView
    
    //MARK: - Initializer
    
    init(
        coordinator: StudentProjectDetailCoordinator,
        presenter: StudentProjectDetailPresenter,
        project: ProjectModel
    ) {
        self.coordinator = coordinator
        self.presenter = presenter
        self.project = project
        self.studentProjectDetailView = StudentProjectDetailView(project: project)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    
    override func loadView() {
        super.loadView()
    
        studentProjectDetailView.backgroundColor = .white
        studentProjectDetailView.delegate = self
        self.view = studentProjectDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setGradientBackground()
    }
    
    
    //MARK: - Actions
    
    func setNavigationBar() {
        self.title = project.name
        
        var backButtonImage = UIImage(named: K.Assets.Icons.backArrowIcon)
        backButtonImage = backButtonImage?.withTintColor(
            .white,
            renderingMode: .alwaysOriginal
        )
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: backButtonImage,
            style: .plain,
            target: self,
            action: #selector(backButtonPressed)
        )
        
    }
    
    @objc func backButtonPressed() {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: - Student Project Detail View Delegate

extension StudentProjectDetailViewController: StudentProjectDetailViewDelegate {
    func envelopeIconTapped() {
        presenter.showMentorReview()
    }
    
    func taskCheckboxTapped(task: TaskModel) {
        presenter.toggleTaskCompletedStatus(task: task)
    }
    
    func rulesViewTapped() {
        presenter.showProjectRules()
    }
    
    func sendFilesButtonTapped() {
        presenter.showUploadFileView()
    }
}

