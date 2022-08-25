//
//  Student.swift
//  Pharus
//
//  Created by Victor Colen on 22/03/22.
//

import Foundation

public struct StudentModel: Codable {

    // MARK: - Properties
    public var id: String
    public let firstName: String
    public let lastName: String
    public let birthdate: String
    public let gender: String
    public let school: String
    public var year: String
    public var city: String
    public var schoolShift: String
    public var avatar: String
    public var email: String
    public var password: String
    public var username: String
    public var projects: [ProjectModel]

    // MARK: - Initializer
    public init(
        id: String,
        firstName: String,
        lastName: String,
        birthdate: String,
        gender: String,
        school: String,
        year: String,
        city: String,
        schoolShift: String,
        avatar: String,
        email: String,
        password: String,
        username: String,
        projects: [ProjectModel]
    ) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.birthdate = birthdate
        self.gender = gender
        self.school = school
        self.year = year
        self.city = city
        self.schoolShift = schoolShift
        self.avatar = avatar
        self.email = email
        self.password = password
        self.username = username
        self.projects = projects
    }

    public init() {
        self.id = "01"
        self.firstName = "Robert"
        self.lastName = "Junior"
        self.birthdate = "18/01/2005"
        self.gender = "M"
        self.school = "NYU"
        self.year = "2o"
        self.city = "BH"
        self.schoolShift = "M"
        self.avatar = "avatar02"
        self.email = "robert.downey@gmail.com"
        self.password = "robertinho"
        self.username = "rdjunior"
        self.projects = []
    }
}

extension StudentModel {
    public static let defaultProject = ProjectModel(
        id: "1",
        name: "El Projeto",
        isSubscribed: true,
        isComplete: true,
        score: 100,
        placement: 2,
        projectDescription: "Lorem ipsum",
        scoreDescription: "bela nota parabens",
        startDate: "22/03/2021",
        endDate: "25/05/2023",
        school: "Batista",
        mentor: "Yo el brabo",
        company: "ioasys",
        tasks: [
            TaskModel(title: "Terminar projeto", isComplete: true, description: "Teste")
        ]
    )
}
