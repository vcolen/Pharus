//
//  ScrollView.swift
//
//
//  Created by Victor Colen on 11/07/22.
//

import UIKit

class ScrollView<Content: UIView>: UIView, ViewCodable {
    public let content: Content

    init(content: () -> Content) {
        self.content = content()
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildHierarchy() {
        addSubview(content)
    }

    func setupConstraints() {
        self.edges()
    }

}
