//
//  HorizontalDivider.swift
//  Sweep
//
//  Created by Renato Martins on 06/12/2023.
//

import SwiftUI

struct HorizontalDivider: View {
    
    let color: Color
    let height: CGFloat
    
    init(color: Color, height: CGFloat = 0.5) {
        self.color = color
        self.height = height
    }
    
    var body: some View {
        color
            .frame(height: height)
    }
}
