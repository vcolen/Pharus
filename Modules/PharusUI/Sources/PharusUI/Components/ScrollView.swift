//
//  ScrollView.swift
//
//
//  Created by Victor Colen on 11/07/22.
//

import UIKit

public class ScrollView<Content: UIView>: UIView, ViewCodable {

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
        self.edges()
        content.edges()
    }
}
