//
//  Container.swift
//  
//
//  Created by Victor Colen on 11/08/22.
//

import Foundation

public class Container {
    public static let shared = Container()
    private var dictionary = [AnyHashable: () -> Any]()

    public init() { }

    public func register<T>(_ type: T.Type, content: @escaping () -> T) {
        dictionary[ObjectIdentifier(type)] = {
            content()
        }
    }

    public func resolve<T>() -> T {
        guard let content = dictionary[ObjectIdentifier(T.self)]?() as? T else {
            fatalError()
        }

        return content
    }
}
