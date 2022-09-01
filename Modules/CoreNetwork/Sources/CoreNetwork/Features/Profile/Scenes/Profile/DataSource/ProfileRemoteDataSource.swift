//
//  ProfileRemoteDataSource.swift
//
//
//  Created by Victor Colen on 31/08/22.
//

import Foundation
import DataKit
import CoreKit
import CoreApp

public struct ProfileRemoteDataSource: DataKit.ProfileRemoteDataSource {
    public init() {

    }

    public func getStudent() -> Student {
        return Bundle.main.decode("Student.json")
    }
}
