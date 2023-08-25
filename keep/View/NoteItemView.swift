//
//  NoteItemView.swift
//  keep
//
//  Created by Thắng Tô on 24/08/2023.
//

import SwiftUI

struct NoteItemView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Hello").frame(maxWidth: .infinity, alignment: .leading).listRowInsets(EdgeInsets())
                Divider()
            }.listRowInsets(EdgeInsets()).onTapGesture {
                print("xxxxxx")
            }
        }.background(Color.red).onTapGesture {
            print("xxxxxx")
        }
    }
}

struct LineView: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        return path
    }
}
