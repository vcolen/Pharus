//
//  CenterView.swift
//
//
//  Created by Victor Colen on 14/07/22.
//

import UIKit

public class CenterView<Original: UIView, Wrapped: UIView>: UIView, WrapperViewable {

    public let originalView: Original
    public let wrappedView: Wrapped
    public let axis: Axis

    init(
        original: Original,
        wrapped: Wrapped,
        axis: Axis
    ) {
        self.originalView = original
        self.wrappedView = wrapped
        self.axis = axis

        super.init(frame: .zero)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CenterView: ViewCodable {
    public func buildHierarchy() {
        addSubview(wrappedView)
    }

    public func setupConstraints() {
        wrappedView.translatesAutoresizingMaskIntoConstraints = false

        switch axis {
        case .horizontally:
            NSLayoutConstraint.activate([
                wrappedView.centerXAnchor.constraint(equalTo: centerXAnchor),
                wrappedView.topAnchor.constraint(equalTo: topAnchor),
                wrappedView.bottomAnchor.constraint(equalTo: bottomAnchor),
                wrappedView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
                wrappedView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor)
            ])

        case .vertically:
            NSLayoutConstraint.activate([
                wrappedView.centerYAnchor.constraint(equalTo: centerYAnchor),
                wrappedView.leadingAnchor.constraint(equalTo: leadingAnchor),
                wrappedView.trailingAnchor.constraint(equalTo: trailingAnchor),
                wrappedView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor),
                wrappedView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor)
            ])

        case .allAxis:
            NSLayoutConstraint.activate([
                wrappedView.centerXAnchor.constraint(equalTo: centerXAnchor),
                wrappedView.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])

        }
    }
}
