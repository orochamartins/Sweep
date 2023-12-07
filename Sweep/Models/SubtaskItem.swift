//
//  SubtaskItem.swift
//  Sweep
//
//  Created by Renato Martins on 07/12/2023.
//

import Foundation

struct SubtaskItem: Identifiable, Codable {
    let id: UUID
    let description: String
    var isCompleted: Bool
    
    init(id: UUID = UUID(), description: String, isCompleted: Bool) {
        self.id = id
        self.description = description
        self.isCompleted = isCompleted
    }
}

extension SubtaskItem {
    static let sampleData: [SubtaskItem] =
    [
    SubtaskItem(description: "Clean the counter top", isCompleted: false),
    SubtaskItem(description: "Sweep the floor", isCompleted: true),
    SubtaskItem(description: "Wipe front windows", isCompleted: false)
    ]
}
