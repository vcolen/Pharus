//
//  File.swift
//
//
//  Created by Victor Colen on 14/07/22.
//

import UIKit

public protocol CenterViewable: UIView { }

public extension CenterViewable {

    func center(
        _ axis: Axis
    ) -> CenterView<Self, Self> {

        return CenterView(
            original: self,
            wrapped: self,
            axis: axis
        )
    }
}

// MARK: - Wrapper Viewable
public extension CenterViewable where Self: WrapperViewable {

    func center(
        _ axis: Axis
    ) -> CenterView<Original, Self> {

        return CenterView(
            original: self.originalView,
            wrapped: self,
            axis: axis
        )
    }
}

// MARK: - UIView
extension UIView: CenterViewable {}
