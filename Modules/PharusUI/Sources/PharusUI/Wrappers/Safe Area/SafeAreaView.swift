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

        NSLayoutConstraint.activate([
            wrappedView.topAnchor.constraint(
                equalTo: edges.contains(.top) ? safeArea.topAnchor : topAnchor
            ),
            wrappedView.leadingAnchor.constraint(
                equalTo: edges.contains(.leading) ? safeArea.leadingAnchor : leadingAnchor
            ),
            wrappedView.trailingAnchor.constraint(
                equalTo: edges.contains(.trailing) ? safeArea.trailingAnchor : trailingAnchor
            ),
            wrappedView.bottomAnchor.constraint(
                equalTo: edges.contains(.bottom) ? safeArea.bottomAnchor : bottomAnchor
            )
        ])
    }
}
