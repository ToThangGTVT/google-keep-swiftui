//
//  ContentView.swift
//  keep
//
//  Created by ThangTQ on 24/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State
    private var fullText: String = "This is some editable text..."
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<8) { _ in
                    Text("flavour.rawValue")
                        .listRowInsets(.init(top: 0,
                                             leading: 0,
                                             bottom: 0,
                                             trailing: 0))
                        .border(Color.red, width: 1)
                    
                }
                
            }.border(Color.green)
            
            TextEditor(text: $fullText).padding(10)
        }
    }
}
