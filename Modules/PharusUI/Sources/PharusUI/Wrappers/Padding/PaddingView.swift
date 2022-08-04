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
    public let edges: MarginEdges
    public let constant: CGFloat

    init(
        original: Original,
        wrapped: Wrapped,
        edges: MarginEdges,
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
        wrappedView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            wrappedView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: edges.contains(.leading) ? constant : 0
            ),
            wrappedView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: edges.contains(.top) ? constant : 0
            ),
            wrappedView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: edges.contains(.trailing) ? -constant : 0
            ),
            wrappedView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: edges.contains(.bottom) ? -constant : 0
            )
        ])
    }
}
