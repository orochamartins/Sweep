//
//  ActivityView.swift
//  Sweep
//
//  Created by Renato Martins on 28/11/2023.
//

import SwiftUI

struct ActivityView: View {
    
    @Binding var activity: Activity
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: activity.icon)
                Text(activity.title)
                
                Spacer()
                
                Circle()
                    .frame(width: 40)
            }
            .padding()
            .font(.title2)
            .fontWeight(.medium)
            
            HStack {
                ForEach(["S", "M", "T", "W", "T", "F", "S"], id: \.self) { day in
                    Text(day)
                        .font(.title3)
                        .frame(width: 32, height: 32)
                        .background(activity.theme.mainColor.opacity(0.15))
                        .foregroundColor(activity.theme.mainColor)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .background(activity.theme.mainColor.opacity(0.1))
        .cornerRadius(20)
        
        .fontDesign(.rounded)
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(activity: .constant(Activity.sampleData[0]))
    }
}
