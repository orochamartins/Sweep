//
//  Theme.swift
//  Sweep
//
//  Created by Renato Martins on 27/11/2023.
//

import SwiftUI

enum Theme: String, CaseIterable, Identifiable, Codable {
    case bubblegum
    case indigo
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case sky
    case tan
    case teal
    case yellow
    
    var mainColor: Color {
        Color(rawValue)
    }
    
    var name: String {
        rawValue.capitalized
    }
    
    var id: String {
        name
    }
}
