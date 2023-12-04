//
//  SweepTextFieldStyle.swift
//  Sweep
//
//  Created by Renato Martins on 04/12/2023.
//

import SwiftUI

struct SweepTextFieldStyle: TextFieldStyle {
    
    let activity: Activity
    
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
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
