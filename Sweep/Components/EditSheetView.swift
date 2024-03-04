//
//  EditSheetView.swift
//  Sweep
//
//  Created by Renato Martins on 31/01/2024.
//

import SwiftUI

struct EditSheetView: View {
    
    @Binding var editIsShowing: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Choose a color")
                    .font(.system(.title3, design: .rounded, weight: .bold))
                Spacer()
                Button(action: {
                    editIsShowing = false
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
                Text("Testing Edit View")
            }
            .padding(.horizontal)
            
            Divider()
                .padding(.vertical, 16)
                .padding(.horizontal)
            
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
    }
}

struct EditSheetView_Previews: PreviewProvider {
    static var previews: some View {
        EditSheetView(editIsShowing: .constant(true))
    }
}
