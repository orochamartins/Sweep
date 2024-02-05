//
//  SheetOneView.swift
//  Sweep
//
//  Created by Renato Martins on 16/01/2024.
//

import SwiftUI

struct SheetOneView: View {
    
    @Binding var showSheet: Bool
    @Binding var colorIsShowing: Bool
    @Binding var textIsShowing: Bool
    @Binding var newColor: Theme
    @Binding var newText: String
    
    var body: some View {
        ZStack {
            
            VStack {
                
                VStack {
                    SingleStickyView(sticky: Sticky(description: newText.isEmpty ? "Write a message here!" : newText, icon: "circle.fill", theme: newColor, position: CGPoint(x: 10, y: 200), rotation: 5.0, scale: 1.0))
                }
                .frame(maxHeight: .infinity)
                
                if colorIsShowing {
                    ColorSheetView(showSheet: $showSheet, colorIsShowing: $colorIsShowing, textIsShowing: $textIsShowing, newColor: $newColor)
                }
                
                if textIsShowing {
                    TextSheetView(showSheet: $showSheet, textIsShowing: $textIsShowing, newText: $newText)
                }
            }
        }
        .background(.ultraThinMaterial)
    }
}

struct SheetOneView_Previews: PreviewProvider {
    static var previews: some View {
        SheetOneView(showSheet: .constant(true), colorIsShowing: .constant(true), textIsShowing: .constant(false), newColor: .constant(.bubblegum), newText: .constant("New message here"))
    }
}
