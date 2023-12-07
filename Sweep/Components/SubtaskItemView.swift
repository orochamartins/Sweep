//
//  SubtaskItemView.swift
//  Sweep
//
//  Created by Renato Martins on 07/12/2023.
//

import SwiftUI

struct SubtaskItemView: View {
    
    let subtask: SubtaskItem
    let activity: Activity
    
    var body: some View {
        HStack {
            Text(subtask.description)
                .foregroundColor(activity.theme.mainColor)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.white)
        .cornerRadius(20)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(activity.theme.mainColor.opacity(0.15).gradient, lineWidth: 2)
        }
        .fontDesign(.rounded)
        .fontWeight(.semibold)
    }
}

struct SubtaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        SubtaskItemView(subtask: SubtaskItem.sampleData[0], activity: Activity.sampleData[0])
    }
}
