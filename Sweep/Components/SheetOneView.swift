//
//  SheetOneView.swift
//  Sweep
//
//  Created by Renato Martins on 16/01/2024.
//

import SwiftUI

struct SheetOneView: View {
    
    @Binding var stickiesData: [Sticky]
    @Binding var showSheet: Bool
    @Binding var colorIsShowing: Bool
    @Binding var textIsShowing: Bool
    @Binding var iconIsShowing: Bool
    @Binding var newColor: Theme
    @Binding var newText: String
    @Binding var newFontDesign: Font.Design
    @Binding var newIcon: String
    
    @State private var stickyOffset = CGSize(width: 0, height: -UIScreen.main.bounds.height / 2)
    
    @State private var sheetOffset = CGSize(width: 0, height: UIScreen.main.bounds.height / 2)
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                VStack {
                    SingleStickyView(sticky: Sticky(description: newText.isEmpty ? "Write a message here!" : newText, icon: newIcon, theme: newColor, position: CGPoint(x: 10, y: 200), rotation: 5.0, scale: 1.0, fontDesign: newFontDesign))
                }
                .frame(maxHeight: .infinity)
                .offset(stickyOffset)
                .onAppear {
                    withAnimation(.spring()) {
                        stickyOffset = CGSize(width: 0, height: 0)
                    }
                }
                
                VStack {
                    if colorIsShowing {
                        ColorSheetView(showSheet: $showSheet, colorIsShowing: $colorIsShowing, textIsShowing: $textIsShowing, newColor: $newColor)
                    }
                    
                    if textIsShowing {
                        TextSheetView(showSheet: $showSheet, textIsShowing: $textIsShowing, iconIsShowing: $iconIsShowing, newColor: $newColor, newText: $newText, newFontDesign: $newFontDesign)
                    }
                    
                    if iconIsShowing {
                        IconSheetView(stickiesData: $stickiesData, showSheet: $showSheet, colorIsShowing: $colorIsShowing, textIsShowing: $textIsShowing, iconIsShowing: $iconIsShowing, newIcon: $newIcon, newColor: $newColor, newText: $newText, newFontDesign: $newFontDesign)
                    }
                }
                .frame(maxWidth: .infinity)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 32))
                .padding(.horizontal)
                .offset(sheetOffset)
                .onAppear {
                    withAnimation(.easeOut) {
                        sheetOffset = CGSize(width: 0, height: 0)
                    }
                }
            }
        }
        .background(.ultraThinMaterial)
    }
}

struct SheetOneView_Previews: PreviewProvider {
    static var previews: some View {
        SheetOneView(stickiesData: .constant(Sticky.sampleData), showSheet: .constant(true), colorIsShowing: .constant(true), textIsShowing: .constant(false), iconIsShowing: .constant(false), newColor: .constant(.bubblegum), newText: .constant("New message here"), newFontDesign: .constant(.default), newIcon: .constant("circle.fill"))
    }
}
