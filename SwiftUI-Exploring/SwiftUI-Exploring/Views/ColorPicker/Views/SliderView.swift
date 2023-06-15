//
//  SliderView.swift
//  SwiftUI-Exploring
//
//  Created by Nouman Gul Junejo on 15/06/2023.
//

import SwiftUI

struct SliderView: View {
    @Binding var value:Double
    var trackColor: Color
    
    var body: some View {
        HStack{
            Text("0")
            VStack{
                Slider(value: $value)
                    .accentColor(trackColor)
                Text(String(format: "%.0f", (value*100*255/100)))
            }
            Text("255")
        }
        .font(.subheadline)
        .padding(.horizontal)
    }
}

#if DEBUG
#Preview{
    SliderView(value: .constant(0.5), trackColor: .green)
}
#endif
