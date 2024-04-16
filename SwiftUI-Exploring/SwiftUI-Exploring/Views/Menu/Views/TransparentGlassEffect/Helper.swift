//
//  Helper.swift
//  SwiftUI-Exploring
//
//  Created by Nouman Gul Junejo on 27/06/2023.
//

import SwiftUI

struct TransparentBlurView: UIViewRepresentable {
    var removeAllFilters: Bool = false
    func makeUIView(context: Context) -> TransparentBlurViewhelper {
        return TransparentBlurViewhelper(removeAllFilters: removeAllFilters)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

class TransparentBlurViewhelper: UIVisualEffectView{
    init (removeAllFilters: Bool) {
        super.init(effect: UIBlurEffect(style: .regular))
        
        if let backdroplayer = layer.sublayers?.first {
            if removeAllFilters {
                backdroplayer.filters = []
            }else{
                backdroplayer.filters?.removeAll(where: { filter in
                    String(describing: filter) != "gaussianBlur"
                })
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
    }
}

//    func makeUIView(context: Context) -› TransparentBlurViewHelper (
//        return TransparentBlurVie Helper(removeAllFilters: removeAllFilters)
//        }
//        fune updateUIViewt_ uiview: TransparentBlurVie Helper, context: Context) {
//        }
//    }
//    I Disabling Trait Changes for Our Transparent Blur View
//    class TransparentBlurViewhelper: UIVisualEffectView {
//        init (removeAllFilters: B001) {
//            super.initleffect: UIBlurEffect(style: .systemUltraThinMaterial))
//            if let backdroplayer • layer. sublayers?. first {
//                if removeAllFilters {
//                    backdropLayer.filters = []
//                } else {
//                    I Removing All Expect Blur Filter
//                    backdropLayer.filters?.removeAll(where: { filter in
//                        String(describing: filter) |= *gaussianBlur*
                        
