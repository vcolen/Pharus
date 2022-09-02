//
//  Student.swift
//  Pharus
//
//  Created by Victor Colen on 21/04/22.
//

import Foundation

public struct Student: Codable {
    public let id: Int
    public let firstName, lastName, birthdate: String
    public let gender, school, year, city: String
    public let schoolShift, email, password, username: String
    public var avatar: String
    public var projects: [Project]

    public static var shared = Student()

    public init(
        id: Int,
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
        projects: [Project]
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
        self.id = 1
        self.firstName = "Robert"
        self.lastName = "Junior"
        self.birthdate = "18/01/2005"
        self.gender = "M"
        self.school = "NYU"
        self.year = "2o"
        self.city = "BH"
        self.schoolShift = "M"
        self.avatar = "18"
        self.email = "robert.downey@gmail.com"
        self.password = "robertinho"
        self.username = "rdjunior"
        self.projects = [
            Project(
                id: 1,
                name: "Lorem ipsum",
                isSubscribed: true,
                isComplete: true,
                score: 100,
                placement: 1,
                projectDescription: "Lorem ipsum",
                scoreDescription: "Lorem ipsum",
                startDate: "22-02-2022",
                endDate: "25-09-2022",
                school: "Lorem ipsum",
                mentor: "Lorem ipsum",
                company: "Lorem ipsum",
                tasks: [
                    Task(id: 1, project: 1, title: "Lorem ipsum", isComplete: true, taskDescription: "Dolor sit amet")
                ]
            )
        ]
    }
}
