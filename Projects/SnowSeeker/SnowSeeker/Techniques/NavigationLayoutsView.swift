//
//  NavigationLayoutsView.swift
//  SnowSeeker
//
//  Created by Joe on 19/06/2022.
//

import SwiftUI

struct NavigationLayoutsView: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                Text("New secondary")
            } label: {
                Text("Hello, World!")
            }
            .navigationTitle("Primary")

            Text("Secondary")
        }
    }
}

struct NavigationLayoutsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLayoutsView()
    }
}
