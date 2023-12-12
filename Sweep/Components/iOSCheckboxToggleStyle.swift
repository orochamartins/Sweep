//
//  iOSCheckboxToggleStyle.swift
//  Sweep
//
//  Created by Renato Martins on 12/12/2023.
//

import SwiftUI

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                configuration.label
            }
        })
    }
}
