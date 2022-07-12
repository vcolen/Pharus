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
    public let edges: Set<MarginEdges>
    public let constant: CGFloat
    private lazy var edgeConstants: [MarginEdges: CGFloat] = [
        .top: 0,
        .leading: 0,
        .trailing: 0,
        .bottom: 0
    ]

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

        for edge in edges {
            edgeConstants[edge] = constant
        }
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
            wrappedView.leadingAnchor.constraint(
                equalTo: safeArea.leadingAnchor,
                constant: edgeConstants[.leading] ?? 0
            ),
            wrappedView.topAnchor.constraint(
                equalTo: safeArea.topAnchor,
                constant: edgeConstants[.top] ?? 0
            ),
            wrappedView.trailingAnchor.constraint(
                equalTo: safeArea.trailingAnchor,
                constant: -(edgeConstants[.trailing] ?? 0)
            ),
            wrappedView.bottomAnchor.constraint(
                equalTo: safeArea.bottomAnchor,
                constant: -(edgeConstants[.bottom] ?? 0)
            )
        ])
    }
}
