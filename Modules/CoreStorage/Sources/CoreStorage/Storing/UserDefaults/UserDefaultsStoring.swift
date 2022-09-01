//
//  UserDefaultsStoring.swift
//
//
//  Created by Victor Colen on 01/09/22.
//

import Foundation

public protocol UserDefaultsStoring {
    var userDefaults: UserDefaults { get }

    func set(_ value: Any, key: String)
    func get<T>(_ type: T.Type, key: String) -> T?
    func getCustomObject<T: Codable>(_ type: T.Type, key: String) -> T?
}

extension UserDefaultsStoring {
    public func set(_ value: Any, key: String) {
        userDefaults.set(value, forKey: key)
    }

    public func get<T>(_ type: T.Type, key: String) -> T? {
        userDefaults.object(forKey: key) as? T
    }

    public func getCustomObject<T: Codable>(_ type: T.Type, key: String) -> T? {
        if let data = UserDefaults.standard.data(forKey: key) {
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                print("Unable to Decode \(T.self): \(error)")
            }
        }
        return nil
    }
}
