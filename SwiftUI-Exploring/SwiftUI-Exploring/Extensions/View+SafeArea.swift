//
//  View+SafeArea.swift
//  SwiftUI-Exploring
//
//  Created by Nouman Gul Junejo on 15/06/2023.
//

import SwiftUI

// extending view to get saferarea.
extension View {
    func getSafeArea() -> UIEdgeInsets {
        guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }),
              let windowScene = window.windowScene else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        return windowScene.keyWindow?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
