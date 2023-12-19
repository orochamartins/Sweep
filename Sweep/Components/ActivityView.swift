//
//  ActivityView.swift
//  Sweep
//
//  Created by Renato Martins on 28/11/2023.
//

import SwiftUI

struct ActivityView: View {
    
    @Binding var activity: Activity
    @State private var isShowing: Bool = true
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 12) {
                Image(systemName: activity.icon)
                    .foregroundColor(activity.theme.mainColor)
                    .frame(width: 48, height: 48)
                    .background(.white.opacity(0.7))
                    .cornerRadius(40)
                Text(activity.title)
                    .font(.system(size: 26))
                    .foregroundColor(activity.theme.mainColor)
                
                Spacer()
                
                Circle()
                    .frame(width: 40)
            }
            .padding(24)
            .font(.title2)
            .fontWeight(.medium)
            
            
            HStack {
                WeekdaysView(activity: activity)
                Spacer()
                Button {
                    isShowing = true
                } label: {
                    Image(systemName: "plus")
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame(width: 36, height: 36)
                        .foregroundColor(.white)
                        .background(activity.theme.mainColor)
                        .cornerRadius(40)
                }
            }
            .padding(24)
            
            VStack {
                
                 if activity.subtasks.isEmpty || isShowing {
                    withAnimation {
                        TaskView(activity: $activity, isShowing: $isShowing)
                    }
                    
                }
                
                if !activity.subtasks.isEmpty {
                    VStack {
                        ForEach($activity.subtasks) { subtask in
                            SubtaskItemView(subtask: subtask, activity: activity)
                            HorizontalDivider(color: activity.theme.mainColor.opacity(0.25))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(.white)
                        .cornerRadius(20)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .strokeBorder(activity.theme.mainColor.opacity(0.15).gradient, lineWidth: 2)
                        }
                        .fontWeight(.semibold)
                    }
                }
            }
            .padding([.horizontal, .bottom], 24)
        }
        .background(activity.theme.mainColor.opacity(0.1).gradient)
        .cornerRadius(24)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(activity.theme.mainColor.opacity(0.15).gradient, lineWidth: 4)
        }
        .fontDesign(.rounded)
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(activity: .constant(Activity.sampleData[0]))
    }
}
