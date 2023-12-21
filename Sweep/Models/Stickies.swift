//
//  Stickies.swift
//  Sweep
//
//  Created by Renato Martins on 28/11/2023.
//

import SwiftUI

@MainActor
class Stickies: ObservableObject {
    @Published var stickies: [Sticky] = []
}
