//
//  OverlayViewable.swift
//
//
//  Created by Victor Colen on 04/08/22.
//

import UIKit

public protocol OverlayViewable: UIView { }

public extension OverlayViewable {

    func overlay<Overlay>(
        _ view: Overlay,
        alignment: OverlayAlignment? = nil
    ) -> OverlayView<Self, Self, Overlay> {

        return OverlayView(
            original: self,
            wrapped: self,
            overlay: view,
            alignment: alignment
        )
    }
}

// MARK: - Wrapper Viewable
public extension OverlayViewable where Self: WrapperViewable {

    func overlay<Overlay>(
        _ view: Overlay,
        alignment: OverlayAlignment
    ) -> OverlayView<Original, Self, Overlay> {

        return OverlayView(
            original: self.originalView,
            wrapped: self,
            overlay: view,
            alignment: alignment
        )
    }
}

// MARK: - UIView
extension UIView: OverlayViewable {}
