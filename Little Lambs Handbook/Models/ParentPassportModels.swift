//
//  Models.swift
//  Little Lambs Handbook
//
//  Created by Ted Nguyen on 1/10/26.
//
import Foundation

struct HandbookSection: Identifiable {
    let id = UUID()
    let number: String
    let title: String
    let items: [String]
}

struct PassportActivity: Identifiable, Codable {
    var id = UUID()
    var title: String
    var date: Date = .now
    var note: String = ""
    var completed: Bool = false
}

struct KidPassport: Codable {
    var childName = ""
    var nickname = ""
    var dateOfBirth = ""
    var className = ""
    var parentName = ""
    var parentPhone = ""
    var activities: [PassportActivity] = []
}

