//
//  ContextMenuView.swift
//  HotProspects
//
//  Created by Joe on 12/05/2022.
//

import SwiftUI

struct ContextMenuView: View {
    @State private var backgroundColor = Color.red
    var body: some View {
        VStack {
            Text("Hello world!")
                .padding()
                .background(backgroundColor)
            
            Text("Change Colour")
                .padding()
                .contextMenu {
                    Button {
                        backgroundColor = .red
                    } label: {
                        Label("Red", systemImage: "checkmark.circle.fill")
                            .foregroundColor(.red) // doesn't work
                    }
                    
                    Button("Blue") {
                        backgroundColor = .blue
                    }
                    
                    Button("Green") {
                        backgroundColor = .green
                    }
                }
        }
    }
}

struct ContextMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuView()
            .preferredColorScheme(.dark)
    }
}
