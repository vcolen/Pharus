//
//  Injected.swift
//
//
//  Created by Victor Colen on 11/08/22.
//

import Foundation

@propertyWrapper
public struct Injected<T> {

    public let wrappedValue: T

    public init() {
        wrappedValue = Container.shared.resolve()
    }
}
