//
//  AnimationsListView.swift
//  SwiftUI-Exploring
//
//  Created by Nouman Gul Junejo on 15/06/2023.
//

import SwiftUI

enum AnimationTypes: CaseIterable {
    case bounce, opacity, rotationEffect, scaleEffect
    
    
    func name() -> String {
        switch self {
        case .bounce:
            return "Bounce Animation"
        case .opacity:
            return "Opacity Animation"
        case .rotationEffect:
            return "Rotation Effect Animation"
        case .scaleEffect:
            return "Scale Effect Animation"
        }
    }
}

struct AnimationsListView: View {
    
    var body: some View {
        List(AnimationTypes.allCases, id: \.self) { type in
            
            switch type{
            case .bounce:
                NavigationLink(destination: ListAnimationBounce()) {
                    Text(type.name())
                }
            case .opacity:
                
                NavigationLink(destination: ListAnimationOpacity()) {
                    Text(type.name())
                }
                
            case .rotationEffect:
                NavigationLink(destination: ListAnimationRotationEffect()) {
                    Text(type.name())
                }
                
            case .scaleEffect:
                
                NavigationLink(destination: ListAnimationScaleEffect()) {
                    Text(type.name())
                }
            }
        }
    }
}

#Preview {
    AnimationsListView()
}
