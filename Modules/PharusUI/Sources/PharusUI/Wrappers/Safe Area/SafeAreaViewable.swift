//
//  SafeAreaViewable.swift
//
//
//  Created by Victor Colen on 12/07/22.
//

import UIKit

public protocol SafeAreaViewable: UIView { }

public extension SafeAreaViewable {

    func safeArea(
        _ edges: MarginEdges
    ) -> SafeAreaView<Self, Self> {

        return SafeAreaView(
            original: self,
            wrapped: self,
            edges: edges
        )
    }
}

// MARK: - Wrapper Viewable
public extension SafeAreaViewable where Self: WrapperViewable {

    func safeArea(
        _ edges: MarginEdges
    ) -> SafeAreaView<Original, Self> {

        return SafeAreaView(
            original: self.originalView,
            wrapped: self, edges: edges
        )
    }
}

// MARK: - UIView
extension UIView: SafeAreaViewable {}
