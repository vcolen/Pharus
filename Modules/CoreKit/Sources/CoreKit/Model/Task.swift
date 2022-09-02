//
//  Task.swift
//  Pharus
//
//  Created by Victor Colen on 21/04/22.
//

import Foundation

public struct Task: Codable {
    public let id: Int
    public let project: Int
    public let title: String
    public var isComplete: Bool
    public let taskDescription: String

    enum CodingKeys: String, CodingKey {
        case id, project, title, isComplete
        case taskDescription = "description"
    }
}

public extension Task {
    mutating func toggleCompletionStatus() {
        isComplete.toggle()
    }
}
