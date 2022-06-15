//
//  Constants.swift
//  Pharus
//
//  Created by Victor Colen on 28/03/22.
//

import Foundation

struct Constants {
    
    static let assets = Assets()
    
    // MARK: - RegEx
    
    struct RegEx {
        static let emailRegEx =  "^[a-z0-9_%+-]+([.-][a-z0-9]+)*@[a-z0-9]+([.-][a-z0-9]+)*\\.[a-z]{2,3}$"
        static let passwordRegEx = "^(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
    }
    
    // MARK: - Cell Reuse Identifiers
    
    struct CellReuseIdentifiers {
        static let userProjects = "userProjects"
        static let userRankingProjects = "userRankingProjects"
        static let avatarSelection = "avatarSelection"
    }
    
    // MARK: - Date Formats
    
    struct DateFormats {
        static let projectDateFormat = "dd/MM/yyyy"
    }
}

struct Assets {
     let icons = Icons()
     let images = Images()
}

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

struct Images {
    static let avatar = Avatar()
    static let company = Company()
    
    static let appLogoImage = "PharusImage"
    
    static let firstPlaceImage = "1stPlaceImage"
    static let secondPlaceImage = "2ndPlaceImage"
    static let thirdPlaceImage = "3rdPlaceImage"
    static let fourthPlaceImage = "4thPlaceImage"
    static let fifthPlaceImage = "5thPlaceImage"
    
    static let firstPlaceMedalImage = "1stPlaceMedalImage"
    static let secondPlaceMedalImage = "2ndPlaceMedalImage"
    static let thirdPlaceMedalImage = "3rdPlaceMedalImage"
    static let fourthPlaceMedalImage = "4thPlaceMedalImage"
    static let fifthPlaceMedalImage = "5thPlaceMedalImage"
}

struct Avatar {
    
    struct FullImage {
        static let avatar1 = "avatar1FullImage"
        static let avatar2 = "avatar2FullImage"
        static let avatar3 = "avatar3FullImage"
        static let avatar4 = "avatar4FullImage"
        static let avatar5 = "avatar5FullImage"
        static let avatar6 = "avatar6FullImage"
        static let avatar7 = "avatar7FullImage"
        static let avatar8 = "avatar8FullImage"
        static let avatar9 = "avatar9FullImage"
        static let avatar10 = "avatar10FullImage"
        static let avatar11 = "avatar11FullImage"
        static let avatar12 = "avatar12FullImage"
        static let avatar13 = "avatar13FullImage"
        static let avatar14 = "avatar14FullImage"
        static let avatar15 = "avatar15FullImage"
        static let avatar16 = "avatar16FullImage"
        static let avatar17 = "avatar17FullImage"
        static let avatar18 = "avatar18FullImage"
        static let avatar19 = "avatar19FullImage"
        static let avatar20 = "avatar20FullImage"
        static let suffix = "FullImage"
    }
    
    struct CircleImage {
        static let avatar1 = "avatar1CircleImage"
        static let avatar2 = "avatar2CircleImage"
        static let avatar3 = "avatar3CircleImage"
        static let avatar4 = "avatar4CircleImage"
        static let avatar5 = "avatar5CircleImage"
        static let avatar6 = "avatar6CircleImage"
        static let avatar7 = "avatar7CircleImage"
        static let avatar8 = "avatar8CircleImage"
        static let avatar9 = "avatar9CircleImage"
        static let avatar10 = "avatar10CircleImage"
        static let avatar11 = "avatar11CircleImage"
        static let avatar12 = "avatar12CircleImage"
        static let avatar13 = "avatar13CircleImage"
        static let avatar14 = "avatar14CircleImage"
        static let avatar15 = "avatar15CircleImage"
        static let avatar16 = "avatar16CircleImage"
        static let avatar17 = "avatar17CircleImage"
        static let avatar18 = "avatar18CircleImage"
        static let avatar19 = "avatar19CircleImage"
        static let avatar20 = "avatar20CircleImage"
        static let suffix = "CircleImage"
    }
    
}

struct Company {
    static let havaianasLogoImage = "havaianasLogoImage"
    static let ioasysLogoImage = "ioasysLogoImage"
    static let osklenLogoImage = "osklenLogoImage"
    static let dupeLogoImage = "dupéLogoImage"
    static let alpargatasLogoImage = "alpargatasLogoImage"
}
