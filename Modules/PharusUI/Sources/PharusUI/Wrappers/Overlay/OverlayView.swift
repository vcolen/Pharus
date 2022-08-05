//
//  OverlayView.swift
//
//
//  Created by Victor Colen on 04/08/22.
//

import UIKit

public class OverlayView<Original: UIView, Wrapped: UIView, Overlay: UIView>: UIView, WrapperViewable {

    public let originalView: Original
    public let wrappedView: Wrapped
    public let overlay: Overlay

    init(
        original: Original,
        wrapped: Wrapped,
        overlay: Overlay
    ) {
        self.originalView = original
        self.wrappedView = wrapped
        self.overlay = overlay

        super.init(frame: .zero)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OverlayView: ViewCodable {
    public func buildHierarchy() {
        addSubview(wrappedView)
        addSubview(overlay)
    }

    public func setupConstraints() {
        wrappedView.translatesAutoresizingMaskIntoConstraints = false
        overlay.translatesAutoresizingMaskIntoConstraints = false
        wrappedView.edges()
        overlay.edges()
    }
}
