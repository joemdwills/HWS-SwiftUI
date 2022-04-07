//
//  TextEditorView.swift
//  Bookworm
//
//  Created by Joe on 05/04/2022.
//

import SwiftUI

//struct Student {
//    var id: UUID
//    var name: String
//}

struct TextEditorView: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationView {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

struct TextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView()
    }
}
