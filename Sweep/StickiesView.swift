//
//  StickiesView.swift
//  Sweep
//
//  Created by Renato Martins on 27/11/2023.
//

import SwiftUI

struct StickiesView: View {
    
    @Binding var stickiesData: [Sticky]
    
    @GestureState private var startLocation: CGPoint? = nil
    
    var body: some View {
        VStack {
            Button("Create") {
                stickiesData.append(contentsOf: [
                    Sticky(description: "We need to clean the kitchen!", icon: "circle.fill", theme: .teal, position: CGPoint(x: 10, y: 200), rotation: 5.0, scale: 1.0),
                    Sticky(description: "There's dirt in the entrance...", icon: "triangle.fill", theme: .orange, position: CGPoint(x: -40, y: -100), rotation: 2.0, scale: 1.0),
                    Sticky(description: "Buy Christmas gifts!", icon: "square.fill", theme: .bubblegum, position: CGPoint(x: 110, y: 220), rotation: 0.0, scale: 1.0)
                ])
            }
            GeometryReader { geometry in
                ForEach($stickiesData) { $sticky in
                    SingleStickyView(sticky: $sticky)
                        .scaleEffect(sticky.scale)
                        .rotationEffect(Angle(degrees: sticky.rotation))
                        .position(sticky.position)
                        .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                sticky.scale = 1.1
                                var newLocation = startLocation ?? sticky.position
                                newLocation.x += gesture.translation.width
                                newLocation.y += gesture.translation.height
                                sticky.position = newLocation
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
    }
}

struct StickiesView_Previews: PreviewProvider {
    static var previews: some View {
        StickiesView(stickiesData: .constant(Sticky.sampleData))
    }
}
