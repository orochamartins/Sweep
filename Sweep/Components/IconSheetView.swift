//
//  IconSheetView.swift
//  Sweep
//
//  Created by Renato Martins on 09/02/2024.
//

import SwiftUI

struct IconSheetView: View {
    
    @Binding var stickiesData: [Sticky]
    let columns = [GridItem(.adaptive(minimum: 48))]
    @Binding var showSheet: Bool
    @Binding var colorIsShowing: Bool
    @Binding var textIsShowing: Bool
    @Binding var iconIsShowing: Bool
    @Binding var newIcon: String
    @Binding var newColor: Theme
    @Binding var newText: String
    @Binding var newFontDesign: Font.Design
    
    let iconArray = ["circle.fill", "triangle.fill", "square.fill", "heart.fill", "star.fill", "diamond.fill", "pentagon.fill", "cross.fill", "cloud.fill", "pawprint.fill", "leaf.fill", "moonphase.first.quarter"]
    
    var body: some View {
        
        let screenBounds = UIScreen.main.bounds
        let centerX = screenBounds.width / 2
        let centerY = screenBounds.height / 2
        
        VStack {
            HStack {
                Text("Choose an icon pattern")
                    .font(.system(.title3, design: .rounded, weight: .bold))
                Spacer()
                Button(action: {
                    showSheet = false
                }) {
                    Image(systemName: "xmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .fontWeight(.black)
                        .fontDesign(.rounded)
                        .scaleEffect(0.416)
                        .foregroundColor(Color(.systemGray))
                        .background(Color(.systemGray6))
                        .clipShape(Circle())
                }
            }
            .padding([.horizontal, .top], 24)
            
            Divider()
                .padding(.top, 8)
                .padding(.horizontal)
                .padding(.bottom, 16)
            
            LazyVGrid(columns: columns, spacing: 24) {
                
                ForEach(iconArray, id: \.self) { icon in
                    Button {
                        newIcon = icon
                    } label: {
                        Image(systemName: icon)
                            .tint(.black)
                            .frame(width: 40, height: 40)
                            .overlay {
                                Circle()
                                    .strokeBorder(newIcon == icon ? .black.opacity(0.6) : Color(.systemGray5), lineWidth: newIcon == icon ? 4 : 1)
                            }
                    }
                }
            }
            .padding(.horizontal)
            
            Divider()
                .padding(.vertical, 16)
                .padding(.horizontal)
            
            Button {
                iconIsShowing = false
                showSheet = false
                
                stickiesData.insert(Sticky(description: newText.count > 0 ? newText : "Write a message here!", icon: newIcon, theme: newColor, position: CGPoint(x: centerX, y: centerY - 118), rotation: 0, scale: 1.0, fontDesign: newFontDesign), at: 0)
            } label: {
                HStack {
                    Text("Make it happen")
                }
                .frame(maxWidth: .infinity)
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
            .padding(.horizontal)
            .padding(.bottom)
            //.glow()
        }
        .frame(maxWidth: .infinity)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 32))
        .padding(.horizontal)
    }
}

struct Glow: ViewModifier {
    @State private var throb = false
    func body(content: Content) -> some View {
        ZStack {
            content
                //.blur(radius: throb ? 7 : 3)
                .shadow(color: .red, radius: throb ? 7 : 0)
                .animation(.easeOut(duration: 1.2).repeatForever(), value: throb)
                .onAppear {
                    throb.toggle()
                }
            content
        }
    }
}

extension View {
    func glow() -> some View {
        modifier(Glow())
    }
}

struct IconSheetView_Previews: PreviewProvider {
    static var previews: some View {
        IconSheetView(stickiesData: .constant(Sticky.sampleData), showSheet: .constant(true), colorIsShowing: .constant(false), textIsShowing: .constant(false), iconIsShowing: .constant(true), newIcon: .constant("circle.fill"), newColor: .constant(.bubblegum), newText: .constant("Default text here"), newFontDesign: .constant(.default)
        )
    }
}
