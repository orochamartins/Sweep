//
//  StickyBackgroundView.swift
//  Sweep
//
//  Created by Renato Martins on 02/01/2024.
//

import SwiftUI

struct StickyBackgroundView: View {
    
    @Binding var sticky: Sticky
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<9) { row in
                HStack(spacing: 0) {
                    ForEach(0..<9) { number in
                        Image(systemName: sticky.icon)
                            .font(.subheadline)
                            .frame(width: 24, height: 24)
                    }
                }
            }
        }
        .frame(width: 200, height: 200)
        .padding(4)
    }
}

struct StickyBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        StickyBackgroundView(sticky: .constant(Sticky.sampleData[1]))
    }
}
