//
//  ActivitiesStore.swift
//  Sweep
//
//  Created by Renato Martins on 28/11/2023.
//

import SwiftUI

@MainActor
class ActivitiesStore: ObservableObject {
    @Published var activities: [Activity] = []
}
