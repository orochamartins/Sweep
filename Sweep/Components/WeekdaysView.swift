//
//  WeekdaysView.swift
//  Sweep
//
//  Created by Renato Martins on 29/11/2023.
//

import SwiftUI

struct WeekdaysView: View {
    
    let activity: Activity
    @State private var today: [Day] = [.Wednesday]
    
    var body: some View {
        HStack {
            ForEach(Day.allCases, id: \.self) { day in
                Text(String(day.rawValue.first!))
                    .font(.title3)
                    .frame(width: 32, height: 32)
                    .background(today.contains(day) ? activity.theme.mainColor : activity.theme.mainColor.opacity(0.15))
                    .foregroundColor(today.contains(day) ? .white : activity.theme.mainColor)
                    .cornerRadius(8)
            }
        }
    }
}

enum Day: String, CaseIterable {
    case Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
}

struct WeekdaysView_Previews: PreviewProvider {
    static var previews: some View {
        WeekdaysView(activity: Activity.sampleData[0])
    }
}
