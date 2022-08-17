//
//  ViewCodable.swift
//
//
//  Created by Victor Colen on 07/07/22.
//

import Foundation

public protocol ViewCodable {
    func buildHierarchy()
    func setupConstraints()
    func applyAdditionalChanges()
}

public extension ViewCodable {

    func buildHierarchy() {}

    func setupConstraints() {}

    func applyAdditionalChanges() {}

    /** Calls  methods buildHierarchy, setupConstraints and applyAdditionalChanges */
    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }
}
