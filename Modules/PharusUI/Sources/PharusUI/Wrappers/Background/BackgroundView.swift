//
//  BackgroundView.swift
//
//
//  Created by Victor Colen on 04/08/22.
//

import UIKit

public class BackgroundView<Original: UIView, Wrapped: UIView, Background: UIView>: UIView, WrapperViewable {

    public let originalView: Original
    public let wrappedView: Wrapped
    public let background: Background

    init(
        original: Original,
        wrapped: Wrapped,
        background: Background
    ) {
        self.originalView = original
        self.wrappedView = wrapped
        self.background = background

        super.init(frame: .zero)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BackgroundView: ViewCodable {
    public func buildHierarchy() {
        addSubview(background)
        addSubview(wrappedView)
    }

    public func setupConstraints() {
        wrappedView.translatesAutoresizingMaskIntoConstraints = false
        background.translatesAutoresizingMaskIntoConstraints = false
        wrappedView.edges()
        background.edges()
    }
}
