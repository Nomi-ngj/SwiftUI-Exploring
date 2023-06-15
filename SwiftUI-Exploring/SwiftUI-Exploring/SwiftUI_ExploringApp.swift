//
//  SwiftUI_ExploringApp.swift
//  SwiftUI-Exploring
//
//  Created by Nouman Gul Junejo on 15/06/2023.
//

import SwiftUI
import SwiftData

@main
struct SwiftUI_ExploringApp: App {

    var body: some Scene {
        WindowGroup {
            MenuView()
        }
        .modelContainer(for: Item.self)
    }
}
