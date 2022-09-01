//
//  Assembler.swift
//
//
//  Created by Victor Colen on 24/08/22.
//

import Foundation
import InjectionKit

enum Assembler {
    static func run(
        _ assemblies: [Assembly],
        in container: Container = .shared
    ) {
        for assembly in assemblies {
            assembly.assemble(container: container)
        }
    }
}
