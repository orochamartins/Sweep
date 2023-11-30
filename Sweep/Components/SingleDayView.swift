//
//  SingleDayView.swift
//  Sweep
//
//  Created by Renato Martins on 30/11/2023.
//

import SwiftUI

struct SingleDayView: View {
    
    let activity: Activity
    let day: Day
    let today: [Day]
    
    var body: some View {
        Text(String(day.rawValue.first!))
            .font(today.contains(day) ? .headline : .body)
            .frame(width: 26, height: 26)
            .background(activity.isCompleted ? activity.theme.mainColor : activity.theme.mainColor.opacity(0.15))
            .foregroundColor(activity.isCompleted ? .white : activity.theme.mainColor)
            .cornerRadius(8)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(activity.theme.mainColor.opacity(0.4), lineWidth: today.contains(day) ? 2 : 0)
                    .frame(width: 36, height: 36)
            }
    }
}

struct SingleDayView_Previews: PreviewProvider {
    static var previews: some View {
        SingleDayView(activity: Activity.sampleData[0], day: Day.Wednesday, today: [.Wednesday])
    }
}
