//
//  UIImage+Extension.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//
import UIKit

extension UIImage {

    static let defaultImage = UIImage()

    // MARK: - Icons

    struct Icons {
        static let bookIcon = UIImage(named: Constants.Assets.Icons.bookIcon)
        static let clockIcon = UIImage(named: Constants.Assets.Icons.clockIcon)
        static let rulesIcon = UIImage(named: Constants.Assets.Icons.rulesIcon)
        static let feedbackIcon = UIImage(named: Constants.Assets.Icons.feedbackIcon)
        static let xmarkIcon = UIImage(named: Constants.Assets.Icons.xmarkIcon)
        static let checkmarkIcon = UIImage(named: Constants.Assets.Icons.checkboxCheckmarkButtonIcon)
        static let expandIcon = UIImage(named: Constants.Assets.Icons.expandIcon)
        static let backArrowIcon = UIImage(named: Constants.Assets.Icons.backArrowIcon)
        static let envelopeIcon = UIImage(named: Constants.Assets.Icons.envelopeIcon)
        static let notificationEnvelopeIcon = UIImage(named: Constants.Assets.Icons.notificationEnvelopeIcon)
        static let uploadIcon = UIImage(named: Constants.Assets.Icons.uploadIcon)
        static let checkIcon = UIImage(named: Constants.Assets.Icons.checkIcon)
        static let logOutIcon = UIImage(named: Constants.Assets.Icons.logoutIcon)
        static let rightArrowIcon = UIImage(named: Constants.Assets.Icons.rightArrowIcon)
        static let warningIcon = UIImage(named: Constants.Assets.Icons.warningIcon)
        static let medalIcon = UIImage(named: Constants.Assets.Icons.medalIcon)
        static let companyIcon = UIImage(named: Constants.Assets.Icons.companyIcon)
        static let errorIcon = UIImage(named: Constants.Assets.Icons.errorIcon)

        static let avatarTabBarIcon = UIImage(named: Constants.Assets.Icons.avatarTabBarIcon)
        static let homeTabBarIcon = UIImage(named: Constants.Assets.Icons.homeTabBarIcon)
        static let profileTabBarIcon = UIImage(named: Constants.Assets.Icons.profileTabBarIcon)
        static let projecsTabBarIcon = UIImage(named: Constants.Assets.Icons.projectsTabBarIcon)
        static let rankingTabBarIcon = UIImage(named: Constants.Assets.Icons.rankingTabBarIcon)

        static let avatarTabBarIconSelected = UIImage(named: Constants.Assets.Icons.avatarTabBarIconSelected)
        static let homeTabBarIconSelected = UIImage(named: Constants.Assets.Icons.homeTabBarIconSelected)
        static let profileTabBarIconSelected = UIImage(named: Constants.Assets.Icons.profileTabBarIconSelected)
        static let projecsTabBarIconSelected = UIImage(named: Constants.Assets.Icons.projectsTabBarIconSelected)
        static let rankingTabBarIconSelected = UIImage(named: Constants.Assets.Icons.rankingTabBarIconSelected)
    }

    // MARK: - Images

    struct Images {

        struct Avatars {
            static let avatarsDict: [UIImage: UIImage] = [
                (UIImage.Images.Avatars.CircleImage.avatar1 ?? .defaultImage): UIImage.Images.Avatars.FullImage.avatar1 ?? .defaultImage
            ]

            struct FullImage {
                static let avatar1 = UIImage(named: Constants.Assets.Images.Avatar.FullImage.avatar1)
                static let avatar2 = UIImage(named: Constants.Assets.Images.Avatar.FullImage.avatar2)
                static let avatar3 = UIImage(named: Constants.Assets.Images.Avatar.FullImage.avatar3)
                static let avatar4 = UIImage(named: Constants.Assets.Images.Avatar.FullImage.avatar4)
                static let avatar5 = UIImage(named: Constants.Assets.Images.Avatar.FullImage.avatar5)
                static let avatar6 = UIImage(named: Constants.Assets.Images.Avatar.FullImage.avatar6)
                static let avatar7 = UIImage(named: Constants.Assets.Images.Avatar.FullImage.avatar7)
                static let avatar8 = UIImage(named: Constants.Assets.Images.Avatar.FullImage.avatar8)
                static let avatar9 = UIImage(named: Constants.Assets.Images.Avatar.FullImage.avatar9)
                static let avatar10 = UIImage(named: Constants.Assets.Images.Avatar.FullImage.avatar10)
                static let avatar11 = UIImage(named: Constants.Assets.Images.Avatar.FullImage.avatar11)
                static let avatar12 = UIImage(named: Constants.Assets.Images.Avatar.FullImage.avatar12)
                static let avatar13 = UIImage(named: Constants.Assets.Images.Avatar.FullImage.avatar13)
                static let avatar14 = UIImage(named: Constants.Assets.Images.Avatar.FullImage.avatar14)
                static let avatar15 = UIImage(named: Constants.Assets.Images.Avatar.FullImage.avatar15)
                static let avatar16 = UIImage(named: Constants.Assets.Images.Avatar.FullImage.avatar16)
                static let avatar17 = UIImage(named: Constants.Assets.Images.Avatar.FullImage.avatar17)
                static let avatar18 = UIImage(named: Constants.Assets.Images.Avatar.FullImage.avatar18)
                static let avatar19 = UIImage(named: Constants.Assets.Images.Avatar.FullImage.avatar19)
                static let avatar20 = UIImage(named: Constants.Assets.Images.Avatar.FullImage.avatar20)

                static let avatars = [
                    avatar1,
                    avatar2,
                    avatar3,
                    avatar4,
                    avatar5,
                    avatar6,
                    avatar7,
                    avatar8,
                    avatar9,
                    avatar10,
                    avatar11,
                    avatar12,
                    avatar13,
                    avatar14,
                    avatar15,
                    avatar16,
                    avatar17,
                    avatar18,
                    avatar19,
                    avatar20
                ]
            }

            struct CircleImage {
                static let avatar1 = UIImage(named: Constants.Assets.Images.Avatar.CircleImage.avatar1)
                static let avatar2 = UIImage(named: Constants.Assets.Images.Avatar.CircleImage.avatar2)
                static let avatar3 = UIImage(named: Constants.Assets.Images.Avatar.CircleImage.avatar3)
                static let avatar4 = UIImage(named: Constants.Assets.Images.Avatar.CircleImage.avatar4)
                static let avatar5 = UIImage(named: Constants.Assets.Images.Avatar.CircleImage.avatar5)
                static let avatar6 = UIImage(named: Constants.Assets.Images.Avatar.CircleImage.avatar6)
                static let avatar7 = UIImage(named: Constants.Assets.Images.Avatar.CircleImage.avatar7)
                static let avatar8 = UIImage(named: Constants.Assets.Images.Avatar.CircleImage.avatar8)
                static let avatar9 = UIImage(named: Constants.Assets.Images.Avatar.CircleImage.avatar9)
                static let avatar10 = UIImage(named: Constants.Assets.Images.Avatar.CircleImage.avatar10)
                static let avatar11 = UIImage(named: Constants.Assets.Images.Avatar.CircleImage.avatar11)
                static let avatar12 = UIImage(named: Constants.Assets.Images.Avatar.CircleImage.avatar12)
                static let avatar13 = UIImage(named: Constants.Assets.Images.Avatar.CircleImage.avatar13)
                static let avatar14 = UIImage(named: Constants.Assets.Images.Avatar.CircleImage.avatar14)
                static let avatar15 = UIImage(named: Constants.Assets.Images.Avatar.CircleImage.avatar15)
                static let avatar16 = UIImage(named: Constants.Assets.Images.Avatar.CircleImage.avatar16)
                static let avatar17 = UIImage(named: Constants.Assets.Images.Avatar.CircleImage.avatar17)
                static let avatar18 = UIImage(named: Constants.Assets.Images.Avatar.CircleImage.avatar18)
                static let avatar19 = UIImage(named: Constants.Assets.Images.Avatar.CircleImage.avatar19)
                static let avatar20 = UIImage(named: Constants.Assets.Images.Avatar.CircleImage.avatar20)

                static let avatars = [
                    avatar1,
                    avatar2,
                    avatar3,
                    avatar4,
                    avatar5,
                    avatar6,
                    avatar7,
                    avatar8,
                    avatar9,
                    avatar10,
                    avatar11,
                    avatar12,
                    avatar13,
                    avatar14,
                    avatar15,
                    avatar16,
                    avatar17,
                    avatar18,
                    avatar19,
                    avatar20
                ]
            }

        }

        struct Companies {
            static let ioasysLogoImage = UIImage(named: Constants.Assets.Images.Company.ioasysLogoImage)
            static let dupeLogoImage = UIImage(named: Constants.Assets.Images.Company.dupeLogoImage)
            static let havaianasLogoImage = UIImage(
                named: Constants.Assets.Images.Company.havaianasLogoImage
            )
            static let alpargatasLogoImage = UIImage(
                named: Constants.Assets.Images.Company.alpargatasLogoImage
            )
            static let osklenLogoImage = UIImage(
                named: Constants.Assets.Images.Company.osklenLogoImage
            )
        }
        static let firstPlaceImage = UIImage(named: Constants.Assets.Images.firstPlaceImage)
        static let secondPlaceImage = UIImage(named: Constants.Assets.Images.secondPlaceImage)
        static let thirdPlaceImage = UIImage(named: Constants.Assets.Images.thirdPlaceImage)
        static let fourthPlaceImage = UIImage(named: Constants.Assets.Images.fourthPlaceImage)
        static let fifthPlaceImage = UIImage(named: Constants.Assets.Images.fifthPlaceImage)

        static let firstPlaceMedalImage = UIImage(named: Constants.Assets.Images.firstPlaceMedalImage)
        static let secondPlaceMedalImage = UIImage(named: Constants.Assets.Images.secondPlaceMedalImage)
        static let thirdPlaceMedalImage = UIImage(named: Constants.Assets.Images.thirdPlaceMedalImage)
        static let fourthPlaceMedalImage = UIImage(named: Constants.Assets.Images.fourthPlaceMedalImage)
        static let fifthPlaceMedalImage = UIImage(named: Constants.Assets.Images.fifthPlaceMedalImage)

        static let appLogoImage = UIImage(named: Constants.Assets.Images.appLogoImage)
    }
}
