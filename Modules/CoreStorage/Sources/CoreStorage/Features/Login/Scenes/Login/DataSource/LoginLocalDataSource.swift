//
//  LoginLocalDataSource.swift
//
//
//  Created by Victor Colen on 29/08/22.
//

import Foundation
import DataKit
import CoreKit
import InjectionKit

public struct LoginLocalDataSource {
    @Injected var userDefaults: UserDefaultsStoring

    public init() { }
}

extension LoginLocalDataSource: DataKit.LoginLocalDataSource {
    public func getUserToken() -> Date? {
        userDefaults.get(Date.self, key: "token")
    }

    public func setUserToken() {
      guard let token = Calendar.current.date(
            byAdding: DateComponents(day: 3),
            to: Date()
      ) else { return }

        userDefaults.set(token, key: "token")
    }
}
