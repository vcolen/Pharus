//
//  ScrollView.swift
//
//
//  Created by Victor Colen on 11/07/22.
//

import UIKit

public class ScrollView<Content: UIView>: UIScrollView, ViewCodable {

    // MARK: - Properties
    public let content: Content

    // MARK: - Initializer
    public init(content: () -> Content) {
        self.content = content()
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Codable
public extension ScrollView {
    func buildHierarchy() {
        addSubview(content)
    }

    func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        content.translatesAutoresizingMaskIntoConstraints = false

        let contentGuide = self.contentLayoutGuide
        let frameGuide = self.frameLayoutGuide

        NSLayoutConstraint.activate([
            frameGuide.leadingAnchor.constraint(equalTo: leadingAnchor),
            frameGuide.topAnchor.constraint(equalTo: topAnchor),
            frameGuide.trailingAnchor.constraint(equalTo: trailingAnchor),
            frameGuide.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            contentGuide.leadingAnchor.constraint(equalTo: content.leadingAnchor),
            contentGuide.topAnchor.constraint(equalTo: content.topAnchor),
            contentGuide.trailingAnchor.constraint(equalTo: content.trailingAnchor),
            contentGuide.bottomAnchor.constraint(equalTo: content.bottomAnchor),
            contentGuide.widthAnchor.constraint(equalTo: frameGuide.widthAnchor)
        ])
    }
}
