//
//  ColorSheetView.swift
//  Sweep
//
//  Created by Renato Martins on 31/01/2024.
//

import SwiftUI

struct ColorSheetView: View {
    
    let columns = [GridItem(.adaptive(minimum: 48))]
    @Binding var showSheet: Bool
    @Binding var colorIsShowing: Bool
    @Binding var textIsShowing: Bool
    @Binding var newColor: Theme
    
    var body: some View {
        VStack {
            HStack {
                Text("Choose a color")
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
                .padding(.vertical, 16)
                .padding(.horizontal)
            
            Button {
                textIsShowing = true
                colorIsShowing = false
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
    }
}

struct ColorSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSheetView(showSheet: .constant(true), colorIsShowing: .constant(true), textIsShowing: .constant(false), newColor: .constant(.bubblegum))
    }
}
