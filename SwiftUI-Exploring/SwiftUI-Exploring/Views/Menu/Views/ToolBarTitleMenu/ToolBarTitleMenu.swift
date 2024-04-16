//
//  ToolBarTitleMenu.swift
//  SwiftUI-Exploring
//
//  Created by Nouman Gul Junejo on 15/06/2023.
//

import SwiftUI

struct ToolBarTitleMenu: View {
    @State private var title = "Selected Title 0"
    var body: some View {
        Text("Nouman Gul Junejo")
            .navigationTitle($title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarTitleMenu {
                ForEach(0..<8) { index in
                    Button {
                        title = "Selected Title \(index)"
                    } label: {
                        Text("Title \(index)")
                    }
                }
            }
    }
}

#Preview {
    ToolBarTitleMenu()
}
