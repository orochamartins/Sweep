//
//  StickiesView.swift
//  Sweep
//
//  Created by Renato Martins on 27/11/2023.
//

import SwiftUI

struct StickiesView: View {
    
    @Binding var stickiesData: [Sticky]
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                ForEach($stickiesData) { $sticky in
                    SingleStickyView(sticky: $sticky)
                        .position(x: sticky.position.width, y: sticky.position.height)
                }
            }
        }
    }
}

struct StickiesView_Previews: PreviewProvider {
    static var previews: some View {
        StickiesView(stickiesData: .constant(Sticky.sampleData))
    }
}
