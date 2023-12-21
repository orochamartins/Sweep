//
//  SweepApp.swift
//  Sweep
//
//  Created by Renato Martins on 27/11/2023.
//

import SwiftUI

@main
struct SweepApp: App {
    
    @StateObject private var stickiesData = Stickies()
    
    var body: some Scene {
        WindowGroup {
            StickiesView(stickiesData: $stickiesData.stickies)
        }
    }
}
