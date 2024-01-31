//
//  SheetOneView.swift
//  Sweep
//
//  Created by Renato Martins on 16/01/2024.
//

import SwiftUI

struct SheetOneView: View {
    
    @Binding var showSheet: Bool
    @Binding var newColor: Theme
    
    var body: some View {
        ZStack {
            
            VStack {
                
                VStack {
                    SingleStickyView(sticky: Sticky(description: "Write a message here!", icon: "circle.fill", theme: newColor, position: CGPoint(x: 10, y: 200), rotation: 5.0, scale: 1.0))
                }
                .frame(maxHeight: .infinity)
                
                ColorSheetView(showSheet: $showSheet, newColor: $newColor)
            }
        }
        .background(.ultraThinMaterial)
    }
}

struct SheetOneView_Previews: PreviewProvider {
    static var previews: some View {
        SheetOneView(showSheet: .constant(true), newColor: .constant(.bubblegum))
    }
}
