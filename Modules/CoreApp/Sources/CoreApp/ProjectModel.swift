//
//  Project.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import Foundation

public struct ProjectModel: Codable {

    // MARK: - Properties
    public var id: String
    public let name: String
    public var isSubscribed: Bool
    public var isComplete: Bool
    public var score: Int?
    public var placement: Int?
    public var projectDescription: String
    public var scoreDescription: String?
    public var startDate: String
    public var endDate: String
    public var school: String
    public var mentor: String
    public var company: String?
    public var tasks: [TaskModel]

    enum CodingKeys: String, CodingKey {
        case id, name, isSubscribed, isComplete, score, placement
        case projectDescription = "description"
        case scoreDescription, startDate, endDate, school, mentor, company, tasks
    }

    // MARK: - Initializer
    public init(
        id: String,
        name: String,
        isSubscribed: Bool,
        isComplete: Bool,
        score: Int?,
        placement: Int?,
        projectDescription: String,
        scoreDescription: String?,
        startDate: String,
        endDate: String,
        school: String,
        mentor: String,
        company: String,
        tasks: [TaskModel]
    ) {
        self.id = id
        self.name = name
        self.isSubscribed = isSubscribed
        self.isComplete = isComplete
        self.score = score
        self.placement = placement
        self.projectDescription = projectDescription
        self.scoreDescription = scoreDescription
        self.startDate = startDate
        self.endDate = endDate
        self.school = school
        self.mentor = mentor
        self.company = company
        self.tasks = tasks
    }
}

extension ProjectModel {
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
