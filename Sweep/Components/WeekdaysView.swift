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
        HStack(spacing: 12) {
            ForEach(Day.allCases, id: \.self) { day in
                SingleDayView(activity: activity, day: day, today: today)
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
