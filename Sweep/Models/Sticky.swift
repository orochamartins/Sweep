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
    var position: CGPoint
    var rotation: Double
    var scale: Double
    
    init(id: UUID = UUID(), description: String, icon: String, theme: Theme, position: CGPoint, rotation: Double, scale: Double) {
        self.id = id
        self.description = description
        self.icon = icon
        self.theme = theme
        self.position = position
        self.rotation = rotation
        self.scale = scale
    }
}

extension Sticky {
    static let sampleData: [Sticky] =
    [
        Sticky(description: "We need to clean the kitchen!", icon: "circle.fill", theme: .teal, position: CGPoint(x: 10, y: 200), rotation: 5.0, scale: 1.0),
        Sticky(description: "There's dirt in the entrance...", icon: "triangle.fill", theme: .orange, position: CGPoint(x: -40, y: -100), rotation: 2.0, scale: 1.0),
        Sticky(description: "Buy Christmas gifts!", icon: "square.fill", theme: .bubblegum, position: CGPoint(x: 110, y: 220), rotation: 0.0, scale: 1.0)
    ]
}
