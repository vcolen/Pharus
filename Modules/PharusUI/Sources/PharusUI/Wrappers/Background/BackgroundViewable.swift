//
//  BackgroundViewable.swift
//
//
//  Created by Victor Colen on 04/08/22.
//

import UIKit

public protocol BackgroundViewable: UIView { }

public extension BackgroundViewable {

    func background<Background>(
        _ view: Background
    ) -> BackgroundView<Self, Self, Background> {

        return BackgroundView(
            original: self,
            wrapped: self,
            background: view
        )
    }
}

// MARK: - Wrapper Viewable
public extension BackgroundViewable where Self: WrapperViewable {

    func background<Background>(
        _ view: Background
    ) -> BackgroundView<Original, Self, Background> {

        return BackgroundView(
            original: self.originalView,
            wrapped: self,
            background: view
        )
    }
}

// MARK: - UIView
extension UIView: BackgroundViewable {}
