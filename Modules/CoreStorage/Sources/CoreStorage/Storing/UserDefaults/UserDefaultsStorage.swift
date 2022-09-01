//
//  File.swift
//
//
//  Created by Victor Colen on 01/09/22.
//

import Foundation

public struct UserDefaultsStorage: UserDefaultsStoring {
    public let userDefaults: UserDefaults

    public init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
}
