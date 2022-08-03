//
//  PaddingViewable.swift
//
//
//  Created by Victor Colen on 07/07/22.
//

import UIKit

public protocol PaddingViewable: UIView { }

public extension PaddingViewable {

    func padding(
        _ edges: MarginEdges,
        _ constant: CGFloat
    ) -> PaddingView<Self, Self> {

        return PaddingView(
            original: self,
            wrapped: self,
            edges: edges,
            constant: constant
        )
    }
}

// MARK: - Wrapper Viewable
public extension PaddingViewable where Self: WrapperViewable {

    func padding(
        _ edges: MarginEdges,
        _ constant: CGFloat
    ) -> PaddingView<Original, Self> {

        return PaddingView(
            original: self.originalView,
            wrapped: self, edges: edges,
            constant: constant
        )
    }
}

// MARK: - UIView
extension UIView: PaddingViewable {}
