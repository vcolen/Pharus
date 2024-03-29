//
//  Project.swift
//  Pharus
//
//  Created by Victor Colen on 21/04/22.
//

import Foundation

struct Project: Codable {
    let id, name: String
    let isSubscribed, isComplete: Bool
    let score, placement: Int?
    let projectDescription: String
    let scoreDescription: String?
    let startDate, endDate, school: String
    let mentor: String
    let company: String
    let tasks: [Task]

    enum CodingKeys: String, CodingKey {
        case id, name, isSubscribed, isComplete, score, placement
        case projectDescription = "description"
        case scoreDescription, startDate, endDate, school, mentor, company, tasks
    }
}
