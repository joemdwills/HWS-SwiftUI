//
//  ConfirmationDialogView.swift
//  InstaFilter
//
//  Created by Joe on 27/04/2022.
//

import SwiftUI

struct ConfirmationDialogView: View {
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .frame(width: 300, height: 300)
            .background(backgroundColor)
            .onTapGesture {
                showingConfirmation = true
            }
            .confirmationDialog("Change background", isPresented: $showingConfirmation) {
                Button("Red") { backgroundColor = .red }
                Button("Blue") { backgroundColor = .blue }
                Button("Green") { backgroundColor = .green }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Select a new color")
            }
    }
}

struct ConfirmationDialogView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationDialogView()
    }
}
