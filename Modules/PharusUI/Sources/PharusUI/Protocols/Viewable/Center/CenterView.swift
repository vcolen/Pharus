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

        if axis == .horizontally {
            wrappedView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        } else if axis == .vertically {
            wrappedView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        } else {
            NSLayoutConstraint.activate([
                wrappedView.centerXAnchor.constraint(equalTo: centerXAnchor),
                wrappedView.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
        }
    }
}
