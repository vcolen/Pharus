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
