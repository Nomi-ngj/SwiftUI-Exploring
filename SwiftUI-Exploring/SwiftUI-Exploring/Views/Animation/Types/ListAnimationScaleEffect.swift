//
//  ListAnimationScaleEffect.swift
//  SwiftUI-Exploring
//
//  Created by Nouman Gul Junejo on 15/06/2023.
//

import SwiftUI

struct ListAnimationScaleEffect: View {
    
    var body: some View {
        ScrollView {
            VStack{
                ForEach(0..<40, id: \.self) { index in
                    
                    ZStack{
                        Rectangle()
                            .fill(Color.red)
                            .frame(width: screenWidth - 40, height: 100)
                        Text("\(index)")
                            .foregroundColor(.white)
                            .font(.body)
                    }
                    .scrollTransition { view, transition in
                        view.scaleEffect(transition.isIdentity ? 1 : transition.value)
                    }
                }.padding()
            }
        }
    }
    
}

#Preview {
    ListAnimationScaleEffect()
}

