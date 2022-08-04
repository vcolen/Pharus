//
//  BackgroundViewable.swift
//
//
//  Created by Victor Colen on 04/08/22.
//

import UIKit

public protocol BackgroundViewable: UIView { }

public extension BackgroundViewable {

    func background(
        _ view: UIView
    ) -> BackgroundView<Self, Self> {

        return BackgroundView(
            original: self,
            wrapped: self,
            background: view
        )
    }
}

// MARK: - Wrapper Viewable
public extension BackgroundViewable where Self: WrapperViewable {

    func background(
        _ view: UIView
    ) -> BackgroundView<Original, Self> {

        return BackgroundView(
            original: self.originalView,
            wrapped: self,
            background: view
        )
    }
}

// MARK: - UIView
extension UIView: BackgroundViewable {}
