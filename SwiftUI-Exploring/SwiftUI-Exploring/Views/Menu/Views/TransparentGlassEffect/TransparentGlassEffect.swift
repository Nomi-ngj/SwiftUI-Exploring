//
//  TransparentGlassEffect.swift
//  SwiftUI-Exploring
//
//  Created by Nouman Gul Junejo on 27/06/2023.
//

import SwiftUI

struct TransparentGlassEffect<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(.white)
                .background(
                    TransparentBlurView(removeAllFilters: false)
                )
                .ignoresSafeArea()
            self.content
        }
        .background(.clear)
        
    }
    
}
//struct TransparentGlassEffect: View {
//    
//    var body: some View {
//        
//        
////        ZStack {
////            // Background Image or Color
////            Color.blue
////            
////            // Glass effect
////            VStack {
////                Spacer()
////                RoundedRectangle(cornerRadius: 16)
////                    .foregroundColor(.white)
////                    .opacity(0.5)
////                    .blur(radius: 8)
////                    .frame(height: 300)
////            }
////            
////            // Content
////            VStack {
////                Text("Hello, Glass Background!")
////                    .font(.largeTitle)
////                    .fontWeight(.bold)
////                    .foregroundColor(.white)
////                    .padding()
////                
////                Spacer()
////            }
////        }
////        .edgesIgnoringSafeArea(.all)
//        
//        GeometryReader { geometry in
//            HStack{
//                Spacer()
//                ZStack(alignment: .center){
//                    RoundedRectangle(cornerRadius: 16)
//                        .frame(width: geometry.size.width * 0.7,
//                               height: geometry.size.height * 0.7)
//                        .blur(radius: 1.3)
//                        .foregroundColor(Color.white.opacity(0.2))
//                    Text("Nouman Gul Junejo")
//                }
//                Spacer()
//            }
//            
////            VStack(alignment: .center){
////                Spacer()
////                HStack(alignment: .center){
////
////                    RoundedRectangle(cornerRadius: 16)
////                        .foregroundColor(Color.red.opacity(0.5))
////                    //                               .blur(radius: 8)
////                        .frame(width: geometry.size.width * 0.7, height: geometry.size.width * 0.7 * 6/7)
////                }
////
////                Spacer()
////            }
//               }
//               .background(Color.blue.edgesIgnoringSafeArea(.all))
//    }
//}

#Preview {
    TransparentGlassEffect{
        Text("Nouman Gul")
    }
    .background(.red)
    .frame(width: screenWidth/2, height: screenHeight/2)
}
