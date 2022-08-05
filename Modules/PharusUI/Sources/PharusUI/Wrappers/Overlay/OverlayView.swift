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
    public let alignment: OverlayAlignment?

    init(
        original: Original,
        wrapped: Wrapped,
        overlay: Overlay,
        alignment: OverlayAlignment? = nil
    ) {
        self.originalView = original
        self.wrappedView = wrapped
        self.overlay = overlay
        self.alignment = alignment

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

        if let alignment = alignment {
            switch alignment {
            case .top:
                NSLayoutConstraint.activate([
                    overlay.topAnchor.constraint(equalTo: topAnchor),
                    overlay.centerXAnchor.constraint(equalTo: centerXAnchor)
                ])
            case .bottom:
                NSLayoutConstraint.activate([
                    overlay.bottomAnchor.constraint(equalTo: bottomAnchor),
                    overlay.centerXAnchor.constraint(equalTo: centerXAnchor)
                ])
            case .leading:
                NSLayoutConstraint.activate([
                    overlay.leadingAnchor.constraint(equalTo: leadingAnchor),
                    overlay.centerYAnchor.constraint(equalTo: centerYAnchor)
                ])
            case .trailing:
                NSLayoutConstraint.activate([
                    overlay.trailingAnchor.constraint(equalTo: trailingAnchor),
                    overlay.centerYAnchor.constraint(equalTo: centerYAnchor)
                ])
            case .topLeading:
                NSLayoutConstraint.activate([
                    overlay.topAnchor.constraint(equalTo: topAnchor),
                    overlay.leadingAnchor.constraint(equalTo: leadingAnchor)
                ])
            case .topTrailing:
                NSLayoutConstraint.activate([
                    overlay.topAnchor.constraint(equalTo: topAnchor),
                    overlay.trailingAnchor.constraint(equalTo: trailingAnchor)
                ])
            case .bottomLeading:
                NSLayoutConstraint.activate([
                    overlay.bottomAnchor.constraint(equalTo: bottomAnchor),
                    overlay.leadingAnchor.constraint(equalTo: leadingAnchor)
                ])
            case .bottomTrailing:
                NSLayoutConstraint.activate([
                    overlay.bottomAnchor.constraint(equalTo: bottomAnchor),
                    overlay.trailingAnchor.constraint(equalTo: trailingAnchor)
                ])
            }
        } else {
            overlay.edges()
        }

        wrappedView.edges()
    }
}
