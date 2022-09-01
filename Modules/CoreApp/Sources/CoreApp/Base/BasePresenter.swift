//
//  BasePresenter.swift
//  Pharus
//
//  Created by Victor Colen on 22/06/22.
//

import Foundation

open class BasePresenter<T> {
    private weak var privateView: AnyObject?
    public var view: T? { privateView as? T }
    public init() { }
}

extension BasePresenter: Presenting {
    public func attach(_ view: AnyObject) {
        guard view as? T != nil else {
            fatalError("View does not conform to \(T.self) Type")
        }
        self.privateView = view
    }
}
