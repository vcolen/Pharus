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
        static let bookIcon = UIImage(named: Constants.assets.icons.bookIcon)
        static let clockIcon = UIImage(named: Constants.assets.icons.clockIcon)
        static let rulesIcon = UIImage(named: Constants.assets.icons.rulesIcon)
        static let feedbackIcon = UIImage(named: Constants.assets.icons.feedbackIcon)
        static let xmarkIcon = UIImage(named: Constants.assets.icons.xmarkIcon)
        static let checkmarkIcon = UIImage(named: Constants.assets.icons.checkboxCheckmarkButtonIcon)
        static let expandIcon = UIImage(named: Constants.assets.icons.expandIcon)
        static let backArrowIcon = UIImage(named: Constants.assets.icons.backArrowIcon)
        static let envelopeIcon = UIImage(named: Constants.assets.icons.envelopeIcon)
        static let notificationEnvelopeIcon = UIImage(named: Constants.assets.icons.notificationEnvelopeIcon)
        static let uploadIcon = UIImage(named: Constants.assets.icons.uploadIcon)
        static let checkIcon = UIImage(named: Constants.assets.icons.checkIcon)
        static let logOutIcon = UIImage(named: Constants.assets.icons.logoutIcon)
        static let rightArrowIcon = UIImage(named: Constants.assets.icons.rightArrowIcon)
        static let warningIcon = UIImage(named: Constants.assets.icons.warningIcon)
        static let medalIcon = UIImage(named: Constants.assets.icons.medalIcon)
        static let companyIcon = UIImage(named: Constants.assets.icons.companyIcon)
        static let errorIcon = UIImage(named: Constants.assets.icons.errorIcon)

        static let avatarTabBarIcon = UIImage(named: Constants.assets.icons.avatarTabBarIcon)
        static let homeTabBarIcon = UIImage(named: Constants.assets.icons.homeTabBarIcon)
        static let profileTabBarIcon = UIImage(named: Constants.assets.icons.profileTabBarIcon)
        static let projecsTabBarIcon = UIImage(named: Constants.assets.icons.projectsTabBarIcon)
        static let rankingTabBarIcon = UIImage(named: Constants.assets.icons.rankingTabBarIcon)

        static let avatarTabBarIconSelected = UIImage(named: Constants.assets.icons.avatarTabBarIconSelected)
        static let homeTabBarIconSelected = UIImage(named: Constants.assets.icons.homeTabBarIconSelected)
        static let profileTabBarIconSelected = UIImage(named: Constants.assets.icons.profileTabBarIconSelected)
        static let projecsTabBarIconSelected = UIImage(named: Constants.assets.icons.projectsTabBarIconSelected)
        static let rankingTabBarIconSelected = UIImage(named: Constants.assets.icons.rankingTabBarIconSelected)
    }

    // MARK: - Images

    struct Images {

        struct Avatars {
            static let avatarsDict: [UIImage: UIImage] = [
                (UIImage.Images.Avatars.CircleImage.avatar1 ?? .defaultImage): UIImage.Images.Avatars.FullImage.avatar1 ?? .defaultImage
            ]

            struct FullImage {
                static let avatar1 = UIImage(named: Constants.assets.images.avatar.fullImage.avatar1)
                static let avatar2 = UIImage(named: Constants.assets.images.avatar.fullImage.avatar2)
                static let avatar3 = UIImage(named: Constants.assets.images.avatar.fullImage.avatar3)
                static let avatar4 = UIImage(named: Constants.assets.images.avatar.fullImage.avatar4)
                static let avatar5 = UIImage(named: Constants.assets.images.avatar.fullImage.avatar5)
                static let avatar6 = UIImage(named: Constants.assets.images.avatar.fullImage.avatar6)
                static let avatar7 = UIImage(named: Constants.assets.images.avatar.fullImage.avatar7)
                static let avatar8 = UIImage(named: Constants.assets.images.avatar.fullImage.avatar8)
                static let avatar9 = UIImage(named: Constants.assets.images.avatar.fullImage.avatar9)
                static let avatar10 = UIImage(named: Constants.assets.images.avatar.fullImage.avatar10)
                static let avatar11 = UIImage(named: Constants.assets.images.avatar.fullImage.avatar11)
                static let avatar12 = UIImage(named: Constants.assets.images.avatar.fullImage.avatar12)
                static let avatar13 = UIImage(named: Constants.assets.images.avatar.fullImage.avatar13)
                static let avatar14 = UIImage(named: Constants.assets.images.avatar.fullImage.avatar14)
                static let avatar15 = UIImage(named: Constants.assets.images.avatar.fullImage.avatar15)
                static let avatar16 = UIImage(named: Constants.assets.images.avatar.fullImage.avatar16)
                static let avatar17 = UIImage(named: Constants.assets.images.avatar.fullImage.avatar17)
                static let avatar18 = UIImage(named: Constants.assets.images.avatar.fullImage.avatar18)
                static let avatar19 = UIImage(named: Constants.assets.images.avatar.fullImage.avatar19)
                static let avatar20 = UIImage(named: Constants.assets.images.avatar.fullImage.avatar20)

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
                static let avatar1 = UIImage(named: Constants.assets.images.avatar.circleImage.avatar1)
                static let avatar2 = UIImage(named: Constants.assets.images.avatar.circleImage.avatar2)
                static let avatar3 = UIImage(named: Constants.assets.images.avatar.circleImage.avatar3)
                static let avatar4 = UIImage(named: Constants.assets.images.avatar.circleImage.avatar4)
                static let avatar5 = UIImage(named: Constants.assets.images.avatar.circleImage.avatar5)
                static let avatar6 = UIImage(named: Constants.assets.images.avatar.circleImage.avatar6)
                static let avatar7 = UIImage(named: Constants.assets.images.avatar.circleImage.avatar7)
                static let avatar8 = UIImage(named: Constants.assets.images.avatar.circleImage.avatar8)
                static let avatar9 = UIImage(named: Constants.assets.images.avatar.circleImage.avatar9)
                static let avatar10 = UIImage(named: Constants.assets.images.avatar.circleImage.avatar10)
                static let avatar11 = UIImage(named: Constants.assets.images.avatar.circleImage.avatar11)
                static let avatar12 = UIImage(named: Constants.assets.images.avatar.circleImage.avatar12)
                static let avatar13 = UIImage(named: Constants.assets.images.avatar.circleImage.avatar13)
                static let avatar14 = UIImage(named: Constants.assets.images.avatar.circleImage.avatar14)
                static let avatar15 = UIImage(named: Constants.assets.images.avatar.circleImage.avatar15)
                static let avatar16 = UIImage(named: Constants.assets.images.avatar.circleImage.avatar16)
                static let avatar17 = UIImage(named: Constants.assets.images.avatar.circleImage.avatar17)
                static let avatar18 = UIImage(named: Constants.assets.images.avatar.circleImage.avatar18)
                static let avatar19 = UIImage(named: Constants.assets.images.avatar.circleImage.avatar19)
                static let avatar20 = UIImage(named: Constants.assets.images.avatar.circleImage.avatar20)

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
            static let ioasysLogoImage = UIImage(named: Constants.assets.images.company.ioasysLogoImage)
            static let dupeLogoImage = UIImage(named: Constants.assets.images.company.dupeLogoImage)
            static let havaianasLogoImage = UIImage(
                named: Constants.assets.images.company.havaianasLogoImage
            )
            static let alpargatasLogoImage = UIImage(
                named: Constants.assets.images.company.alpargatasLogoImage
            )
            static let osklenLogoImage = UIImage(
                named: Constants.assets.images.company.osklenLogoImage
            )
        }
        static let firstPlaceImage = UIImage(named: Constants.assets.images.firstPlaceImage)
        static let secondPlaceImage = UIImage(named: Constants.assets.images.secondPlaceImage)
        static let thirdPlaceImage = UIImage(named: Constants.assets.images.thirdPlaceImage)
        static let fourthPlaceImage = UIImage(named: Constants.assets.images.fourthPlaceImage)
        static let fifthPlaceImage = UIImage(named: Constants.assets.images.fifthPlaceImage)

        static let firstPlaceMedalImage = UIImage(named: Constants.assets.images.firstPlaceMedalImage)
        static let secondPlaceMedalImage = UIImage(named: Constants.assets.images.secondPlaceMedalImage)
        static let thirdPlaceMedalImage = UIImage(named: Constants.assets.images.thirdPlaceMedalImage)
        static let fourthPlaceMedalImage = UIImage(named: Constants.assets.images.fourthPlaceMedalImage)
        static let fifthPlaceMedalImage = UIImage(named: Constants.assets.images.fifthPlaceMedalImage)

        static let appLogoImage = UIImage(named: Constants.assets.images.appLogoImage)
    }
}
