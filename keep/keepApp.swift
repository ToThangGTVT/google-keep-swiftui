//
//  keepApp.swift
//  keep
//
//  Created by ThangTQ on 24/08/2023.
//

import SwiftUI

@main
struct keepApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct Demo: View {
    var colors: [Color] = [.red, .blue, .yellow]
    var body: some View {
        List {
            ForEach(colors, id: \.self) { color in
                color
            }.listRowInsets(EdgeInsets())
        }
        // Update: Different iOS versions have different
        // default List styles, so set explicit one if needed
        .listStyle(PlainListStyle())
    }
}
