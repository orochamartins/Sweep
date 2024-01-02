//
//  SingleStickyView.swift
//  Sweep
//
//  Created by Renato Martins on 28/11/2023.
//

import SwiftUI

struct SingleStickyView: View {
    
    @Binding var sticky: Sticky
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            StickyBackgroundView(sticky: $sticky)
            
            VStack(alignment: .leading) {
                Text(sticky.description)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            }
        }
        .frame(width: 200, height: 200)
        .padding(16)
        .background(sticky.theme.mainColor.opacity(0.1).gradient)
        .background(.white)
        .cornerRadius(24)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(sticky.theme.mainColor.opacity(0.15).gradient, lineWidth: 4)
        }
        .font(.custom("HomemadeApple-Regular.ttf", size: 40))
        .foregroundColor(sticky.theme.mainColor)
        .fontWeight(.semibold)
        .fontDesign(.rounded)
    }
}

struct SingleStickyView_Previews: PreviewProvider {
    static var previews: some View {
        SingleStickyView(sticky: .constant(Sticky.sampleData[0]))
    }
}
