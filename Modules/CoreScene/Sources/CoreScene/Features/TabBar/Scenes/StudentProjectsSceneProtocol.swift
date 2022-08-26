//
//  StudentProjectsSceneProtocol.swift
//
//
//  Created by Victor Colen on 26/08/22.
//

import Foundation
import CoreApp
import UIKit

public protocol StudentProjectsSceneProtocol {
    var rootViewController: UITabBarController { get }
    var student: StudentModel { get }
}
