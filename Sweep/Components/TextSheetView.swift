//
//  TextSheetView.swift
//  Sweep
//
//  Created by Renato Martins on 05/02/2024.
//

import SwiftUI

struct TextSheetView: View {
    
    @Binding var showSheet: Bool
    @Binding var textIsShowing: Bool
    @Binding var iconIsShowing: Bool
    @Binding var newColor: Theme
    @Binding var newText: String
    @Binding var newFontDesign: Font.Design
    
    var body: some View {
        VStack {
            HStack {
                Text("Write a message")
                    .font(.system(.title3, design: .rounded, weight: .bold))
                Spacer()
                Button(action: {
                    showSheet = false
                    textIsShowing = false
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
            
            VStack {
                HStack {
                    VStack {
                        Button {
                            newFontDesign = .default
                        } label: {
                            Text("Aa")
                        }
                        .foregroundColor(.black)
                        .font(.system(.title2, design: .default, weight: .semibold))
                        .frame(maxWidth: 80, minHeight: 50)
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .strokeBorder(newFontDesign == .default ? .black : Color(.systemGray5), lineWidth: newFontDesign == .default ? 4 : 1)
                        }
                        Text("Default")
                            .font(.system(size: 15, design: .rounded))
                            .foregroundColor(Color(.systemGray3))
                    }
                    .contentShape(Rectangle())
                    
                    VStack {
                        Button {
                            newFontDesign = .rounded
                        } label: {
                            Text("Aa")
                        }
                        .foregroundColor(.black)
                        .font(.system(.title2, design: .rounded, weight: .semibold))
                        .frame(maxWidth: 80, minHeight: 50)
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .strokeBorder(newFontDesign == .rounded ? .black : Color(.systemGray5), lineWidth: newFontDesign == .rounded ? 4 : 1)
                        }
                        Text("Rounded")
                            .font(.system(size: 15, design: .rounded))
                            .foregroundColor(Color(.systemGray3))
                    }
                    .contentShape(Rectangle())
                    
                    VStack {
                        Button {
                            newFontDesign = .serif
                        } label: {
                            Text("Aa")
                        }
                        .foregroundColor(.black)
                        .font(.system(.title2, design: .serif, weight: .semibold))
                        .frame(maxWidth: 80, minHeight: 50)
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .strokeBorder(newFontDesign == .serif ? .black : Color(.systemGray5), lineWidth: newFontDesign == .serif ? 4 : 1)
                        }
                        Text("Serif")
                            .font(.system(size: 15, design: .rounded))
                            .foregroundColor(Color(.systemGray3))
                    }
                    .contentShape(Rectangle())
                    
                    VStack {
                        Button {
                            newFontDesign = .monospaced
                        } label: {
                            Text("Aa")
                        }
                        .foregroundColor(.black)
                        .font(.system(.title2, design: .monospaced, weight: .semibold))
                        .frame(maxWidth: 80, minHeight: 50)
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .strokeBorder(newFontDesign == .monospaced ? .black : Color(.systemGray5), lineWidth: newFontDesign == .monospaced ? 4 : 1)
                        }
                        Text("Mono")
                            .font(.system(size: 15, design: .rounded))
                            .foregroundColor(Color(.systemGray3))
                    }
                    .contentShape(Rectangle())
                }
            }
            .padding(.bottom, 16)
            .padding(.horizontal)
            
            VStack {
                VStack(alignment: .leading) {
                    TextField("Message for the stickies", text: $newText)
                        .padding()
                        .font(.system(.body, design: .rounded, weight: .medium))
                }
                .frame(height: 80, alignment: .top)
                .overlay {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke()
                        .fill(Color(.systemGray5))
                }
            }
            .padding(.horizontal)
            
            Divider()
                .padding(.vertical, 16)
                .padding(.horizontal)
            
            Button {
                textIsShowing = false
                iconIsShowing = true
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

struct TextSheetView_Previews: PreviewProvider {
    static var previews: some View {
        TextSheetView(showSheet: .constant(true), textIsShowing: .constant(true), iconIsShowing: .constant(false), newColor: .constant(.bubblegum), newText: .constant("This is a message"), newFontDesign: .constant(.default))
    }
}
