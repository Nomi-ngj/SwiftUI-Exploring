//
//  View+Shadow.swift
//  SwiftUI-Exploring
//
//  Created by Nouman Gul Junejo on 15/06/2023.
//

import Foundation
import SwiftUI

extension View{
    func northWestShadow(radius:CGFloat = 16,offset:CGFloat = 6) -> some View{
        return self
            .shadow(color: .highlight, radius: radius, x: -offset,y: -offset)
            .shadow(color: .shadow, radius: radius,x: offset,y: offset)
    }
    
    func southEastShadow(radius:CGFloat = 14, offset: CGFloat = 6) -> some View{
        return self
            .shadow(color: .shadow, radius: radius, x: -offset, y: -offset)
            .shadow(color: .highlight, radius: radius , x: offset, y: offset)
    }
}
