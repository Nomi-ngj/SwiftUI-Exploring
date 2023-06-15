//
//  ColorView.swift
//  SwiftUI-Exploring
//
//  Created by Nouman Gul Junejo on 15/06/2023.
//

import SwiftUI

struct ColorView: View {
    
    var rgb:RGB
    var size:CGFloat
   
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.element)
                .northWestShadow()
            Rectangle()
                .fill(rgb.getColor())
                .padding(20)
        }
        .frame(width: size,height: size)
    }
}

#if DEBUG
#Preview {
    ColorView(rgb: .init(), size: 200)
}
#endif
