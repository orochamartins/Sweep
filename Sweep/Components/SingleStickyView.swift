//
//  SingleStickyView.swift
//  Sweep
//
//  Created by Renato Martins on 28/11/2023.
//

import SwiftUI

struct SingleStickyView: View {
    
    let sticky: Sticky
    
    var body: some View {
        ZStack(alignment: .center) {
            
            LinearGradient(gradient: Gradient(colors: [sticky.theme.mainColor.opacity(0.0), sticky.theme.mainColor.opacity(0.15)]), startPoint: .top, endPoint: .bottom)
                .frame(width: 220, height: 220, alignment: .center)
                .mask(StickyBackgroundView(sticky: sticky))
            
            

            VStack(alignment: .leading) {
                Text(sticky.description)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            }
            .padding(16)
        }
        .frame(width: 236, height: 236)
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
        SingleStickyView(sticky: Sticky.sampleData[0])
    }
}
