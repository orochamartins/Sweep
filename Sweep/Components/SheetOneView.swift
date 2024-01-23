//
//  SheetOneView.swift
//  Sweep
//
//  Created by Renato Martins on 16/01/2024.
//

import SwiftUI

struct SheetOneView: View {
    
    let columns = [GridItem(.adaptive(minimum: 48))]
    
    @State private var newColor: Theme = .bubblegum
    
    var body: some View {
        ZStack {
            
            VStack {
                
                VStack {
                    SingleStickyView(sticky: Sticky(description: "Write a message here!", icon: "circle.fill", theme: newColor, position: CGPoint(x: 10, y: 200), rotation: 5.0, scale: 1.0))
                }
                .frame(maxHeight: .infinity)
                
                VStack {
                    HStack {
                        Text("Choose a color")
                            .font(.system(.title3, design: .rounded, weight: .bold))
                        Spacer()
                        Button(action: {}) {
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
                        .padding(.bottom, 16)
                    
                    LazyVGrid(columns: columns, spacing: 24) {
                        
                        ForEach(Theme.allCases) { color in
                            Button {
                                newColor = color
                            } label: {
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .tint(color.mainColor.gradient)
                                    .overlay {
                                        Circle()
                                            .strokeBorder(newColor == color ? .black.opacity(0.6) : .white.opacity(0.8), lineWidth: 4)
                                    }
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    Divider()
                        .padding(.top, 8)
                        .padding(.bottom, 16)
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Text("Continue")
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
                }
                .frame(maxWidth: .infinity)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 32))
                .padding(.horizontal)
            }
        }
        .background(.ultraThinMaterial.opacity(0.8))
    }
}

struct SheetOneView_Previews: PreviewProvider {
    static var previews: some View {
        SheetOneView()
    }
}
