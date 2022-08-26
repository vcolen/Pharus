//
//  File.swift
//
//
//  Created by Victor Colen on 25/08/22.
//

import Foundation
import UIKit
import AppFeature

public enum App {

    public static func build(
        in window: UIWindow,
        result: (AppCoordinator) -> Void
    ) {
        Assembler.run([
            CoreKitAssembly(),
            DataKitAssembly()
//            CoreSDKAssembly(),
//            FeaturesAssembly()
        ])

        result(AppCoordinator(window: window))
    }
}
