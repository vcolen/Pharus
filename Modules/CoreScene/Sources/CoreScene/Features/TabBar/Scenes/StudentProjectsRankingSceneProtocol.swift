//
//  StudentProjectsRankingSceneProtocol.swift
//
//
//  Created by Victor Colen on 26/08/22.
//

import Foundation
import UIKit
import CoreApp

public protocol StudentProjectsRankingSceneProtocol {
    var rootViewController: UITabBarController { get }
    var student: StudentModel { get }
}
