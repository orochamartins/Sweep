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
    @State private var finalInput = ""
    @Binding var subtasks: [TaskView]
    
    let activity: Activity
    
    var body: some View {
        VStack {
            if !isCompleted {
                HStack(spacing: 16) {
                    TextField("Insert task name", text: $textInput)
                        .textFieldStyle(SweepTextFieldStyle(activity: activity))
                        .foregroundColor(activity.theme.mainColor)
                    
                    Button {
                        finalInput = textInput
                        isCompleted = true
                        
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
            } else {
                HStack {
                    Text(finalInput)
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
            }
        }
        .fontWeight(.semibold)
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(subtasks: .constant([]), activity: Activity.sampleData[0])
    }
}
