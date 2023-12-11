//
//  ContentView.swift
//  Sweep
//
//  Created by Renato Martins on 27/11/2023.
//

import SwiftUI

struct ActivitiesView: View {
    
    @Binding var activities: [Activity]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    Button {
                        let testTask = Activity(title: "Bathroom", icon: "toilet", theme: .teal, image: "example.svg", isCompleted: false)
                        activities.append(testTask)
                    } label: {
                        Text("Create")
                    }
                    ForEach($activities) { activity in
                        ActivityView(activity: activity)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView(activities: .constant(Activity.sampleData))
    }
}
