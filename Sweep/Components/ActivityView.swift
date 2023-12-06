//
//  ActivityView.swift
//  Sweep
//
//  Created by Renato Martins on 28/11/2023.
//

import SwiftUI

struct ActivityView: View {
    
    @Binding var activity: Activity
    @State var substasks: [TaskView] = []
    
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
                HorizontalDivider(color: activity.theme.mainColor.opacity(0.25))
                
                TaskView(subtasks: $substasks, activity: activity)
            }
            .padding([.horizontal, .bottom], 24)
        }
        .background(activity.theme.mainColor.opacity(0.1).gradient)
        .cornerRadius(20)
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
