//
//  ContentView.swift
//  keep
//
//  Created by ThangTQ on 24/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var fullText: String = "This is some editable text..."
    var body: some View {
          NavigationView {
              List {
                  ForEach(0..<8) { _ in
                      AsyncImage(
                              url: URL(
                                string: "https://picsum.photos/600"
                                )) { image in
                          image
                              .resizable()
                              .scaledToFill()
                              .frame(height: 240)
                      } placeholder: {
                          ZStack {
                              RoundedRectangle(cornerRadius: 12)
                                  .fill(.gray.opacity(0.6))
                                  .frame(height: 240)
                              ProgressView()
                          }
                      }
                      .aspectRatio(3 / 2, contentMode: .fill)
                      .cornerRadius(12)
                      .padding(.vertical)
                      .shadow(radius: 4)
                    }
                  }
                  .listStyle(.inset)
                  .navigationTitle("Home")
              TextEditor(text: $fullText).padding(10)
          }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
