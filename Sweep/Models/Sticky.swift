//
//  Sticky.swift
//  Sweep
//
//  Created by Renato Martins on 27/11/2023.
//

import Foundation

struct Sticky: Identifiable, Codable {
    let id: UUID
    var description: String
    var icon: String
    var theme: Theme
    var position: CGSize
    var rotation: Double
    
    init(id: UUID = UUID(), description: String, icon: String, theme: Theme, position: CGSize, rotation: Double) {
        self.id = id
        self.description = description
        self.icon = icon
        self.theme = theme
        self.position = position
        self.rotation = rotation
    }
}

extension Sticky {
    static let sampleData: [Sticky] =
    [
        Sticky(description: "We need to clean the kitchen!", icon: "circle.fill", theme: .teal, position: CGSize(width: 10, height: 200), rotation: 5.0),
        Sticky(description: "There's dirt in the entrance...", icon: "triangle.fill", theme: .orange, position: CGSize(width: -40, height: -100), rotation: 2.0),
        Sticky(description: "Buy Christmas gifts!", icon: "square.fill", theme: .bubblegum, position: CGSize(width: 110, height: 220), rotation: 0.0)
    ]
}
