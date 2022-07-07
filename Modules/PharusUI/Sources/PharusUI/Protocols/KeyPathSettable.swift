//
//  KeyPathSettable.swift
//
//
//  Created by Victor Colen on 07/07/22.
//

import Foundation

public protocol KeyPathSettable { }

public extension KeyPathSettable {
     func setting<Value>(
        _ keyPath: WritableKeyPath<Self, Value>,
        to value: Value
    ) -> Self {

        var newSelf = self
        newSelf[keyPath: keyPath] = value
        return newSelf
    }

    func setup(_ setup: (inout Self) -> Void) -> Self {
        var newSelf = self
        setup(&newSelf)
        return newSelf
    }

    func assign(to reference: inout Self?) -> Self {
        reference = self
        return self
    }
}
