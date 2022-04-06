//
//  StudentProjectDetailView.swift
//  Pharus
//
//  Created by Victor Colen on 05/04/22.
//

import UIKit

class StudentProjectDetailView: UIView {
    //MARK: - Views
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .cardColor
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectDetailView.mainView"
        
        return view
    }()
    
    lazy var mainScrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.accessibilityIdentifier = "StudentProjectDetailView.mainScrollView"
        
        return scrollView
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectDetailView.mainStackView"
        
        return stackView
    }()
    
    lazy var mentorLabel: UILabel = {
        let label = UILabel()
        label.text = "Mentor: José da Silva"
        label.font = .cardTitleFont
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectDetailView.mentorLabel"
        
        return label
    }()
    
    lazy var descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectDetailView.descriptionStackView"
        
        return stackView
    }()
    
    lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Descrição:"
        label.font = .cardSubtitleFont
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectDetailView.descriptionTitleLabel"
        
        return label
    }()
    
    lazy var descriptionTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla bibendum elit tellus, at condimentum mauris sagittis ut. Nam auctor nunc non ipsum blandit tempus. "
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectDetailView.descriptionTextLabel"
        
        return label
    }()
    
    lazy var taskStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 29
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectDetailView.taskStackView"
        
        return stackView
    }()
    
    lazy var titleHelper: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectDetailView.taskStackView"
        
        return view
    }()
    
    lazy var taskTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lista de Tarefas"
        label.font = .cardSubtitleFont
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectDetailView.taskTitleLabel"
        
        return label
    }()
    
    lazy var individualTaskHelperStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectDetailView.individualTaskHelperStackView"
        
        return stackView
    }()
    
    lazy var checkmarkImage: UIImage = {
        var image = UIImage(systemName: "checkmark")
        return image!
    }()
    
    lazy var completedTasksProgressStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectDetailView.completedTasksProgressStackView"
        return stackView
    }()
    
    lazy var completedTasksLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Completadas 3 de 4 tarefas (75%)"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectDetailView.completedTasksLabel"
        
        return label
    }()
    
    lazy var completedTasksProgressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressTintColor = .darkCardColor
        progressView.progress = 0.75
        progressView.layer.cornerRadius = 8
        progressView.accessibilityIdentifier = "StudentProjectDetailView.completedTasksProgressView"
        
        return progressView
    }()
        
    lazy var anotherHelperView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var uploadFilesButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.setTitle("Enviar arquivos", for: .normal)
        button.backgroundColor = .darkCardColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "StudentProjectDetailView.uploadFilesButton"
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubviews() {
        addSubview(mainScrollView)
        
        mainScrollView.addSubview(mainView)
        
        mainView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(mentorLabel)
        mainStackView.addArrangedSubview(descriptionStackView)
        
        descriptionStackView.addArrangedSubview(descriptionTitleLabel)
        descriptionStackView.addArrangedSubview(descriptionTextLabel)
        
        mainStackView.addArrangedSubview(taskStackView)
        
        taskStackView.addArrangedSubview(titleHelper)
        titleHelper.addSubview(taskTitleLabel)
        
        taskStackView.addArrangedSubview(individualTaskHelperStackView)
        
        for task in 1...10 {
            let individualTaskStackView = UIStackView()
            individualTaskStackView.translatesAutoresizingMaskIntoConstraints = false
            individualTaskStackView.axis = .horizontal
            individualTaskStackView.spacing = 11
            
            let taskTitleLabel = UILabel()
            taskTitleLabel.translatesAutoresizingMaskIntoConstraints = false
            taskTitleLabel.text = "Tarefa \(task)"
            
            let taskCheckboxButton = UIButton()
            taskCheckboxButton.layer.borderWidth = 1
            taskCheckboxButton.layer.borderColor = UIColor.black.cgColor
            taskCheckboxButton.layer.cornerRadius = 4
            taskCheckboxButton.setImage(checkmarkImage, for: .normal)
            
            
            NSLayoutConstraint.activate([
                taskCheckboxButton.widthAnchor.constraint(equalToConstant: 25),
                taskCheckboxButton.heightAnchor.constraint(equalToConstant: 25)
            ])
            
            taskCheckboxButton.addAction(UIAction {  _ in
                if taskCheckboxButton.currentImage == self.checkmarkImage {
                    print("desativar")
                    taskCheckboxButton.setImage(.none, for: .normal)
                } else {
                    print("ativar")
                    taskCheckboxButton.setImage(self.checkmarkImage, for: .normal)
                }
                
            }, for: .touchUpInside)
            
            individualTaskStackView.addArrangedSubview(taskCheckboxButton)
            individualTaskStackView.addArrangedSubview(taskTitleLabel)
            
            individualTaskHelperStackView.addArrangedSubview(individualTaskStackView)
        }
        
        mainStackView.addArrangedSubview(completedTasksProgressStackView)
        
        completedTasksProgressStackView.addArrangedSubview(completedTasksLabel)
        completedTasksProgressStackView.addArrangedSubview(completedTasksProgressView)
        
        mainStackView.addArrangedSubview(anotherHelperView)
        
        anotherHelperView.addSubview(uploadFilesButton)
        
        uploadFilesButton.addAction(UIAction { _ in
            print("enviar arquivos")
        }, for: .touchUpInside)
        
    }
    
    //MARK: - Constraints
    
    func setupConstraints() {
        
        //Scroll View
        self.stretch(mainScrollView)
        
        //Main View
        self.stretch(mainView, to: mainScrollView, top: 50, left: 16, bottom: -10, right: -16)
        
        //Main Stack View
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 24),
            mainStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 24),
            mainStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -24),
            mainStackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -10),
            mainStackView.centerXAnchor.constraint(equalTo: mainScrollView.centerXAnchor)
        ])
        
        //Title Helper
        NSLayoutConstraint.activate([
            titleHelper.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            titleHelper.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            titleHelper.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        //Completed Tasks Progress View
        NSLayoutConstraint.activate([
            completedTasksProgressView.heightAnchor.constraint(equalToConstant: 22)
        ])
        
        //Upload Files Button
        NSLayoutConstraint.activate([
            uploadFilesButton.centerYAnchor.constraint(equalTo: anotherHelperView.centerYAnchor),
            uploadFilesButton.centerXAnchor.constraint(equalTo: anotherHelperView.centerXAnchor),
            uploadFilesButton.heightAnchor.constraint(equalToConstant: 44),
            uploadFilesButton.widthAnchor.constraint(equalToConstant: 195),
            anotherHelperView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
