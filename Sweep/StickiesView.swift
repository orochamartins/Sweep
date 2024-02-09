//
//  StickiesView.swift
//  Sweep
//
//  Created by Renato Martins on 27/11/2023.
//

import SwiftUI

struct StickiesView: View {
    
    @Binding var stickiesData: [Sticky]
    @State private var showSheet: Bool = false
    @State private var colorIsShowing: Bool = false
    @State private var textIsShowing: Bool = false
    @State private var iconIsShowing: Bool = false
    @State private var newColor: Theme = .bubblegum
    @State private var newText: String = ""
    @State private var newFontDesign: Font.Design = .default
    @State private var newIcon: String = "circle.fill"
    
    @GestureState private var startLocation: CGPoint? = nil
   
    
    var body: some View {
        ZStack {
            Image("background_dot")
                .resizable(resizingMode: .tile)
                .opacity(0.9)
                .ignoresSafeArea()
            
            VStack {
                GeometryReader { geometry in
                    ForEach(Array($stickiesData.enumerated().reversed()), id: \.element.id) { index, $sticky in
                        SingleStickyView(sticky: sticky)
                            .scaleEffect(sticky.scale)
                            .rotationEffect(Angle(degrees: sticky.rotation))
                            .position(sticky.position)
                            .gesture(
                                DragGesture(minimumDistance: 0)
                                    .onChanged { gesture in
                                        sticky.scale = 1.1
                                        var newLocation = startLocation ?? sticky.position
                                        newLocation.x += gesture.translation.width
                                        newLocation.y += gesture.translation.height
                                        sticky.position = newLocation
                                        
                                        let sticky = stickiesData.remove(at: index)
                                        stickiesData.insert(sticky, at: 0)
                                    }
                                    .updating($startLocation) { (value, startLocation, transaction) in
                                        startLocation = startLocation ?? sticky.position
                                    }
                                    .onEnded { _ in
                                        sticky.scale = 1.0
                                    }
                            )
                            .gesture(
                                RotationGesture()
                                    .onChanged { value in
                                        sticky.scale = 1.1
                                        sticky.rotation = value.degrees
                                    }
                                    .onEnded { _ in
                                        sticky.scale = 1.0
                                    }
                            )
                            .animation(.spring(), value: sticky.scale)
                    }
                }
            }
            
            VStack {
                Rectangle()
                 .fill(.ultraThinMaterial)
                 .mask {
                     VStack(spacing: 0) {
                         LinearGradient(
                             colors: [
                                 Color.white.opacity(1),
                                 Color.white.opacity(0),
                             ],
                             startPoint: .top,
                             endPoint: .bottom
                         )
                     }
                 }
                 .frame(height: 150)
                 .allowsHitTesting(false)
                
                Spacer()
                ZStack {
                   Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask {
                        VStack(spacing: 0) {
                            LinearGradient(
                                colors: [
                                    Color.white.opacity(1),
                                    Color.white.opacity(0),
                                ],
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        }
                    }
                    .frame(height: 150)
                    .allowsHitTesting(false)
                    
                    Button {
                        withAnimation {
                            showSheet = true
                            colorIsShowing = true
                        }
                        stickiesData.append(contentsOf: [
                            Sticky(description: "We need to clean the kitchen!", icon: "circle.fill", theme: .teal, position: CGPoint(x: 10, y: 200), rotation: 5.0, scale: 1.0, fontDesign: .rounded),
                            Sticky(description: "There's dirt in the entrance...", icon: "triangle.fill", theme: .orange, position: CGPoint(x: -40, y: -100), rotation: 2.0, scale: 1.0, fontDesign: .serif),
                            Sticky(description: "Buy Christmas gifts!", icon: "square.fill", theme: .bubblegum, position: CGPoint(x: 110, y: 220), rotation: 0.0, scale: 1.0, fontDesign: .monospaced)
                        ])
                    } label: {
                        HStack {
                            Image(systemName: "plus")
                            Text("Add Stickie")
                        }
                        .padding()
                        .background(.black.gradient)
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(24)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                        .overlay {
                            RoundedRectangle(cornerRadius: 24)
                                .strokeBorder(.white.opacity(0.3).gradient, lineWidth: 3)
                        }
                    }
                }
            }
            .ignoresSafeArea()
            
            if showSheet {
                SheetOneView(showSheet: $showSheet, colorIsShowing: $colorIsShowing, textIsShowing: $textIsShowing, iconIsShowing: $iconIsShowing, newColor: $newColor, newText: $newText, newFontDesign: $newFontDesign, newIcon: $newIcon)
            }
        }
    }
}

struct StickiesView_Previews: PreviewProvider {
    static var previews: some View {
        StickiesView(stickiesData: .constant(Sticky.sampleData))
    }
}
