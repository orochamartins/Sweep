//
//  SheetOneView.swift
//  Sweep
//
//  Created by Renato Martins on 16/01/2024.
//

import SwiftUI

struct SheetOneView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.2)
                .ignoresSafeArea()
            
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
            }
            .frame(maxWidth: .infinity)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal)
        }
    }
}

struct SheetOneView_Previews: PreviewProvider {
    static var previews: some View {
        SheetOneView()
    }
}
