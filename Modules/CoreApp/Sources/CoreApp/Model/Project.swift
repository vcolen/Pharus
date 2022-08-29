//
//  Project.swift
//  Pharus
//
//  Created by Victor Colen on 21/04/22.
//

import Foundation

public struct Project: Codable {
    public let id, name: String
    public var isSubscribed, isComplete: Bool
    public let score, placement: Int?
    public let projectDescription: String
    public let scoreDescription: String?
    public let startDate, endDate, school: String
    public let mentor: String
    public let company: String?
    public var tasks: [Task]

    enum CodingKeys: String, CodingKey {
        case id, name, isSubscribed, isComplete, score, placement
        case projectDescription = "description"
        case scoreDescription, startDate, endDate, school, mentor, company, tasks
    }
}

extension Project {
    public var completedTasksCount: Int {
        self.tasks.filter { $0.isComplete }.count
    }

    public var completionPercentage: Float {
        Float(completedTasksCount)/Float(self.tasks.count)
    }

    public var daysRemaining: Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.dateFormats.projectDateFormat

        let projectEndDate = dateFormatter.date(from: self.endDate) ?? Date()
        let daysRemaining = Date.getDifferenceInDays(
            between: Date(),
            and: projectEndDate
        )

        return daysRemaining
    }
}
