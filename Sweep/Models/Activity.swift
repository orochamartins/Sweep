//
//  Activity.swift
//  Sweep
//
//  Created by Renato Martins on 27/11/2023.
//

import Foundation

struct Activity: Identifiable, Codable {
    let id: UUID
    var title: String
    var icon: String
    var theme: Theme
    var image: String
    var isCompleted: Bool
    var daysCompleted: [Date] = []
    
    init(id: UUID = UUID(), title: String, icon: String, theme: Theme, image: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.icon = icon
        self.theme = theme
        self.image = image
        self.isCompleted = isCompleted
    }
}

extension Activity {
    static let sampleData: [Activity] =
    [
        Activity(title: "Bathroom", icon: "triangle", theme: .teal, image: "example.svg", isCompleted: false),
        Activity(title: "Garage", icon: "triangle", theme: .orange, image: "example.svg", isCompleted: false),
        Activity(title: "Kitchen", icon: "triangle", theme: .tan, image: "example.svg", isCompleted: false)
    ]
}
