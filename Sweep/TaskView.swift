//
//  TaskView.swift
//  Sweep
//
//  Created by Renato Martins on 04/12/2023.
//

import SwiftUI

struct TaskView: View {
    
    @State private var isCompleted = false
    @State private var textInput = ""
    @Binding var activity: Activity
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                TextField("Insert task name", text: $textInput)
                    .textFieldStyle(SweepTextFieldStyle(activity: activity))
                    .foregroundColor(activity.theme.mainColor)
                    
                Button {
                    let newSubtask = SubtaskItem(description: textInput, isCompleted: false)
                    activity.subtasks.append(newSubtask)
                    isCompleted = true
                    isShowing = false
                        
                } label: {
                    Image(systemName: "checkmark")
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame(width: 36, height: 36)
                        .foregroundColor(textInput.count < 3 ? activity.theme.mainColor.opacity(0.5) : activity.theme.mainColor)
                        .background(textInput.count < 3 ? activity.theme.mainColor.opacity(0.05) : activity.theme.mainColor.opacity(0.15) )
                            .cornerRadius(40)
                }
                .disabled(textInput.count < 3)
            }
        }
        .fontWeight(.semibold)
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(activity: .constant(Activity.sampleData[0]), isShowing: .constant(true))
    }
}
