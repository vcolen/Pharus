import UIKit
import PharusUI
import CoreApp

class StudentHomeView: UIView {

    // MARK: - Properties
    var student: StudentModel
    private let cards: [StudentHomeMiniCardView] = [
        StudentHomeMiniCardView(
            cardType: .warning,
            message: "\"Rabisco em arte\" termina em 6 dias!"
        ),
        StudentHomeMiniCardView(
            cardType: .newMedal,
            message: "O projeto \"Introdução a Robótica\" te deu uma medalha!"
        ),
        StudentHomeMiniCardView(
            cardType: .newProject,
            message: "Novo projeto: Algorítmo no seu dia"
        )
    ]

    // MARK: - Views
    private lazy var mainScrollView = VScrollView {
        VStackView([
            helloStudentLabel,

            HStackView([
                studentAvatarImageView
            ])
            .frame(height: 100),

            HScrollView {
                miniCardStackView
            }
            .setting(\.showsHorizontalScrollIndicator, to: false)
            .frame(height: 180),

            newsHelperView
        ])
        .setting(\.spacing, to: 49)
        .padding(.top, 80)
        .padding(.bottom, 45)
    }
    .background(homeBackgroundImageView)

    private lazy var homeBackgroundImageView = UIImageView()
        .setting(\.image, to: .pharusImages.homeBackground)
        .padding(.top, 80)
        .safeArea(.bottom)
        .safeArea(.top)

    private lazy var helloStudentLabel = UILabel()
        .setting(\.text, to: "Olá, Antônia!")
        .setting(\.textColor, to: .white)
        .setting(\.font, to: .largeTitleBold)
        .setting(\.textAlignment, to: .center)

    lazy var studentAvatarImageView = UIImageView()
        .setting(\.image, to: CircleAvatarImages.avatar1)
        .frame(width: 100, height: 100)
        .center(.allAxis)

    private lazy var miniCardStackView = HStackView([])
        .setting(\.spacing, to: 32)

    lazy var newsHelperView = UIView()
        .frame(height: 221)

    // MARK: - Initializer
    init(student: StudentModel) {
        self.student = student

        super.init(frame: .zero)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Codable
extension StudentHomeView: ViewCodable {
    func buildHierarchy() {
        addSubview(mainScrollView)
    }

    func setupConstraints() {
        mainScrollView.edges()
    }

    func applyAdditionalChanges() {
        helloStudentLabel.text = "Olá, \(student.firstName)!"
        setupMiniCardStackView()
    }
}

// MARK: - Additional Methods
extension StudentHomeView {
    func setupMiniCardStackView() {
        for card in cards {
            miniCardStackView.addArrangedSubview(
                card
                    .frame(width: 127, height: 180)
            )
        }
    }

    func showStudentAvatar() {
        studentAvatarImageView.originalView.image = UIImage(
            named: "avatar" + student.avatar + PharusUIConstants.assets.images.avatar.circleImage.suffix
        )
    }
}
