//
//  PaddingView.swift
//
//
//  Created by Victor Colen on 07/07/22.
//

import UIKit

public class PaddingView<Original: UIView, Wrapped: UIView>: UIView, WrapperViewable {

    public let originalView: Original
    public let wrappedView: Wrapped
    public let edges: Set<MarginEdges>
    public let constant: CGFloat

    init(
        original: Original,
        wrapped: Wrapped,
        edges: Set<MarginEdges>,
        constant: CGFloat
    ) {
        self.originalView = original
        self.wrappedView = wrapped
        self.edges = edges
        self.constant = constant
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PaddingView: ViewCodable {
    public func buildHierarchy() {
        addSubview(wrappedView)
    }

    public func setupConstraints() {
        if edges.contains(.all) {
            NSLayoutConstraint.activate([
                wrappedView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: constant),
                wrappedView.topAnchor.constraint(equalTo: topAnchor, constant: constant),
                wrappedView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -constant),
                wrappedView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -constant)
            ])
            return
        }

        if edges.contains(.top) {
            wrappedView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: constant
            ).isActive = true
        }

        if edges.contains(.leading) {
            wrappedView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: constant
            ).isActive = true
        }

        if edges.contains(.trailing) {
            wrappedView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -constant
            ).isActive = true
        }

        if edges.contains(.bottom) {
            wrappedView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -constant
            ).isActive = true
        }
    }
}
