//
//  MarginEdges.swift
//
//
//  Created by Victor Colen on 08/07/22.
//

import Foundation

public struct MarginEdges: OptionSet {
    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public static let top = MarginEdges(rawValue: 1 << 0)
    public static let bottom = MarginEdges(rawValue: 1 << 1)
    public static let leading = MarginEdges(rawValue: 1 << 2)
    public static let trailing = MarginEdges(rawValue: 1 << 3)
    public static var all: MarginEdges {
        [.top, .bottom, .leading, .trailing]
    }
}
