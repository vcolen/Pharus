//
//  StudentHomeView.swift
//  Pharus
//
//  Created by Victor Colen on 12/04/22.
//
import UIKit

class StudentHomeView: UIView {
    
    //MARK: - Views
    
    lazy var mainScrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.accessibilityIdentifier = "StudentHomeView.mainScrollView"
        
        return scrollView
    }()
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentHomeView.mainView"
        return view
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentHomeView.mainStackView"
        return stackView
    }()
    
    lazy var helloStudentLabel: UILabel = {
        let label = UILabel()
        label.text = "Olá, Antônia!"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentHomeView.helloStudentLabel"
        return label
    }()
    
    lazy var studentAvatarHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentHomeView.studentAvatarHelperView"
        return view
    }()
    
    lazy var studentAvatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.image = .images.userImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "StudentHomeView.studentAvatarImageView"
        return imageView
    }()
    
    lazy var miniCardScrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.accessibilityIdentifier = "StudentHomeView.miniCardScrollView"
        return scrollView
    }()
    
    lazy var miniCardStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 32
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentHomeView.miniCardStackView"
        return stackView
    }()
    
    lazy var newsHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentHomeView.newsHelperView"
        return view
    }()
    
    lazy var newsView: HomeNewsView = {
        let view = HomeNewsView()
        view.mainView.backgroundColor = .white
        view.mainView.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentHomeView.newsView"
        return view
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
        
        mainStackView.addArrangedSubview(helloStudentLabel)
        mainStackView.addArrangedSubview(studentAvatarHelperView)
        
        studentAvatarHelperView.addSubview(studentAvatarImageView)
        
        mainStackView.addArrangedSubview(miniCardScrollView)
        
        miniCardScrollView.addSubview(miniCardStackView)
        
        for _ in 0...20 {
            let view = StudentHomeMiniCardView()
            view.mainView.backgroundColor = .card.orangeHomeStandardCardBackground
            view.mainView.layer.cornerRadius = 16
            
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 180),
                view.widthAnchor.constraint(equalToConstant: 127)
            ])
            
            miniCardStackView.addArrangedSubview(view)
        }
        
        mainStackView.addArrangedSubview(newsHelperView)
        
        newsHelperView.addSubview(newsView)
    }
    
    //MARK: - Constraints
    
    func setupConstraints() {
        
        //Main Scroll View
        self.stretch(mainScrollView)
        
        //Main View
        self.stretch(mainView, to: mainScrollView)
        
        //Main Stack View
        self.stretch(mainStackView, to: mainView, top: 32, bottom: -45)
        NSLayoutConstraint.activate([
            mainStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
        
        //Student Avatar Helper View
        NSLayoutConstraint.activate([
            studentAvatarHelperView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        //Student Avatar Image View
        studentAvatarImageView.center(in: studentAvatarHelperView)
        
        //Mini Card Scroll View
        NSLayoutConstraint.activate([
            miniCardScrollView.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        //Mini Card Stack View
        NSLayoutConstraint.activate([
            miniCardStackView.leadingAnchor.constraint(equalTo: miniCardScrollView.leadingAnchor),
            miniCardStackView.trailingAnchor.constraint(equalTo: miniCardScrollView.trailingAnchor)
        ])
        
        //News Helper View
        NSLayoutConstraint.activate([
            newsHelperView.heightAnchor.constraint(equalToConstant: 221)
        ])
        
        //News View
        newsView.center(in: newsHelperView)
        NSLayoutConstraint.activate([
            newsView.leadingAnchor.constraint(equalTo: newsHelperView.leadingAnchor, constant: 16),
            newsView.trailingAnchor.constraint(equalTo: newsHelperView.trailingAnchor, constant: -16)
        ])
    }
}
