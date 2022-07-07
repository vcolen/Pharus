//
//  WrapperViewable.swift
//
//
//  Created by Victor Colen on 07/07/22.
//

import UIKit

public protocol WrapperViewable {

    associatedtype Original: UIView
    associatedtype Wrapped: UIView

    var originalView: Original { get }
    var wrappedView: Wrapped { get }
}
