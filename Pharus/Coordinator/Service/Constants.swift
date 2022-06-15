//
//  Constants.swift
//  Pharus
//
//  Created by Victor Colen on 28/03/22.
//

import Foundation

struct Constants {
    static let assets = Assets()
    static let regEx = RegEx()
    static let cellReuseIdentifiers = CellReuseIdentifiers()
    static let dateFormats = DateFormats()
}

// MARK: - RegEx

struct RegEx {
     let emailRegEx =  "^[a-z0-9_%+-]+([.-][a-z0-9]+)*@[a-z0-9]+([.-][a-z0-9]+)*\\.[a-z]{2,3}$"
     let passwordRegEx = "^(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
}

// MARK: - Cell Reuse Identifiers

struct CellReuseIdentifiers {
     let userProjects = "userProjects"
     let userRankingProjects = "userRankingProjects"
     let avatarSelection = "avatarSelection"
}

// MARK: - Date Formats

struct DateFormats {
     let projectDateFormat = "dd/MM/yyyy"
}

// MARK: - Assets

struct Assets {
     let icons = Icons()
     let images = Images()
}

// MARK: - Icons

struct Icons {
    let backArrowIcon = "backArrowIcon"
    let logoutIcon = "logoutIcon"
    let bookIcon = "bookIcon"
    let clockIcon = "clockIcon"
    let rulesIcon = "rulesIcon"
    let feedbackIcon = "feedbackIcon"
    let xmarkIcon = "xmarkIcon"
    let checkboxCheckmarkButtonIcon = "checkboxCheckmarkIcon"
    let expandIcon = "ExpandIcon"
    let envelopeIcon = "envelopeIcon"
    let notificationEnvelopeIcon = "notificationEnvelopeIcon"
    let uploadIcon = "uploadIcon"
    let checkIcon = "checkIcon"
    let rightArrowIcon = "rightArrowIcon"
    let warningIcon = "warningIcon"
    let medalIcon =  "medalIcon"
    let companyIcon = "companyIcon"
    let errorIcon = "errorIcon"

    let avatarTabBarIcon = "avatarTabBarIcon"
    let homeTabBarIcon = "homeTabBarIcon"
    let profileTabBarIcon = "profileTabBarIcon"
    let projectsTabBarIcon = "projectsTabBarIcon"
    let rankingTabBarIcon = "rankingTabBarIcon"

    let avatarTabBarIconSelected = "avatarTabBarIconSelected"
    let homeTabBarIconSelected = "homeTabBarIconSelected"
    let profileTabBarIconSelected = "profileTabBarIconSelected"
    let projectsTabBarIconSelected = "projectsTabBarIconSelected"
    let rankingTabBarIconSelected = "rankingTabBarIconSelected"
}

// MARK: - Images

struct Images {
     let avatar = Avatar()
     let company = Company()

     let appLogoImage = "PharusImage"

     let firstPlaceImage = "1stPlaceImage"
     let secondPlaceImage = "2ndPlaceImage"
     let thirdPlaceImage = "3rdPlaceImage"
     let fourthPlaceImage = "4thPlaceImage"
     let fifthPlaceImage = "5thPlaceImage"

     let firstPlaceMedalImage = "1stPlaceMedalImage"
     let secondPlaceMedalImage = "2ndPlaceMedalImage"
     let thirdPlaceMedalImage = "3rdPlaceMedalImage"
     let fourthPlaceMedalImage = "4thPlaceMedalImage"
     let fifthPlaceMedalImage = "5thPlaceMedalImage"
}

// MARK: - Avatar

struct Avatar {
    let fullImage = FullImage()
    let circleImage = CircleImage()
}

// MARK: - FullImage

struct FullImage {
     let avatar1 = "avatar1FullImage"
     let avatar2 = "avatar2FullImage"
     let avatar3 = "avatar3FullImage"
     let avatar4 = "avatar4FullImage"
     let avatar5 = "avatar5FullImage"
     let avatar6 = "avatar6FullImage"
     let avatar7 = "avatar7FullImage"
     let avatar8 = "avatar8FullImage"
     let avatar9 = "avatar9FullImage"
     let avatar10 = "avatar10FullImage"
     let avatar11 = "avatar11FullImage"
     let avatar12 = "avatar12FullImage"
     let avatar13 = "avatar13FullImage"
     let avatar14 = "avatar14FullImage"
     let avatar15 = "avatar15FullImage"
     let avatar16 = "avatar16FullImage"
     let avatar17 = "avatar17FullImage"
     let avatar18 = "avatar18FullImage"
     let avatar19 = "avatar19FullImage"
     let avatar20 = "avatar20FullImage"
     let suffix = "FullImage"
}

// MARK: - Circle Image

struct CircleImage {
     let avatar1 = "avatar1CircleImage"
     let avatar2 = "avatar2CircleImage"
     let avatar3 = "avatar3CircleImage"
     let avatar4 = "avatar4CircleImage"
     let avatar5 = "avatar5CircleImage"
     let avatar6 = "avatar6CircleImage"
     let avatar7 = "avatar7CircleImage"
     let avatar8 = "avatar8CircleImage"
     let avatar9 = "avatar9CircleImage"
     let avatar10 = "avatar10CircleImage"
     let avatar11 = "avatar11CircleImage"
     let avatar12 = "avatar12CircleImage"
     let avatar13 = "avatar13CircleImage"
     let avatar14 = "avatar14CircleImage"
     let avatar15 = "avatar15CircleImage"
     let avatar16 = "avatar16CircleImage"
     let avatar17 = "avatar17CircleImage"
     let avatar18 = "avatar18CircleImage"
     let avatar19 = "avatar19CircleImage"
     let avatar20 = "avatar20CircleImage"
     let suffix = "CircleImage"
}

// MARK: - Company

struct Company {
     let havaianasLogoImage = "havaianasLogoImage"
     let ioasysLogoImage = "ioasysLogoImage"
     let osklenLogoImage = "osklenLogoImage"
     let dupeLogoImage = "dupéLogoImage"
     let alpargatasLogoImage = "alpargatasLogoImage"
}
