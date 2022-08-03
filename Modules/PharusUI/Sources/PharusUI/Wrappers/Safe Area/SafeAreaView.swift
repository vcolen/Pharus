//
//  SafeAreaView.swift
//
//
//  Created by Victor Colen on 12/07/22.
//

import UIKit

public class SafeAreaView<Original: UIView, Wrapped: UIView>: UIView, WrapperViewable {

    public let originalView: Original
    public let wrappedView: Wrapped
    public let edges: MarginEdges

    init(
        original: Original,
        wrapped: Wrapped,
        edges: MarginEdges
    ) {
        self.originalView = original
        self.wrappedView = wrapped
        self.edges = edges
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SafeAreaView: ViewCodable {
    public func buildHierarchy() {
        addSubview(wrappedView)
    }

    public func setupConstraints() {
        wrappedView.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = safeAreaLayoutGuide
        var constraints = [
            wrappedView.topAnchor.constraint(equalTo: topAnchor),
            wrappedView.leadingAnchor.constraint(equalTo: leadingAnchor),
            wrappedView.trailingAnchor.constraint(equalTo: trailingAnchor),
            wrappedView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]

        if edges.contains(.top) {
            constraints[0] = wrappedView.topAnchor.constraint(equalTo: safeArea.topAnchor)
        }

        if edges.contains(.leading) {
            constraints[1] = wrappedView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor)
        }

        if edges.contains(.trailing) {
            constraints[2] = wrappedView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        }

        if edges.contains(.bottom) {
            constraints[3] = wrappedView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        }

        NSLayoutConstraint.activate(constraints)
    }
}
