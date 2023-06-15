//
//  ListAnimationRotationEffect.swift
//  SwiftUI-Exploring
//
//  Created by Nouman Gul Junejo on 15/06/2023.
//

import SwiftUI

struct ListAnimationRotationEffect: View {
    
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
                    .scrollTransition(
                        topLeading: .identity,
                        bottomTrailing: .interactive
                    ) { view, transition in
                        view.rotationEffect(.radians(transition.value))
                    }
                }.padding()
            }
        }
    }
}

#Preview {
    ListAnimationRotationEffect()
}

