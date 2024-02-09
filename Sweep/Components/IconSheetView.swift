//
//  IconSheetView.swift
//  Sweep
//
//  Created by Renato Martins on 09/02/2024.
//

import SwiftUI

struct IconSheetView: View {
    
    let columns = [GridItem(.adaptive(minimum: 48))]
    @Binding var showSheet: Bool
    @Binding var colorIsShowing: Bool
    @Binding var textIsShowing: Bool
    @Binding var iconIsShowing: Bool
    @Binding var newIcon: String
    
    let iconArray = ["circle.fill", "triangle.fill", "square.fill", "heart.fill", "star.fill", "house.fill", "gamecontroller.fill", "briefcase.fill", "paintbrush.pointed.fill", "pawprint.fill", "leaf.fill", "sun.min.fill"]
    
    var body: some View {
        VStack {
            HStack {
                Text("Choose an icon pattern")
                    .font(.system(.title3, design: .rounded, weight: .bold))
                Spacer()
                Button(action: {showSheet = false}) {
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
                textIsShowing = true
                colorIsShowing = false
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
        }
        .frame(maxWidth: .infinity)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 32))
        .padding(.horizontal)
    }
}

struct IconSheetView_Previews: PreviewProvider {
    static var previews: some View {
        IconSheetView(showSheet: .constant(true), colorIsShowing: .constant(false), textIsShowing: .constant(false), iconIsShowing: .constant(true), newIcon: .constant("circle.fill"))
    }
}
