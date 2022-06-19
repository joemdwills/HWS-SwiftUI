//
//  SearchableView.swift
//  SnowSeeker
//
//  Created by Joe on 19/06/2022.
//

import SwiftUI

struct SearchableView: View {
    @State private var searchtext = ""
    let allNames = ["Subh", "Vina", "Melvin", "Stefanie"]
    
    
    var body: some View {
        NavigationView {
            List(allNames, id: \.self) { name in
                Text(name)
            }
            .searchable(text: $searchtext, prompt: "Look for something")
            .navigationTitle("Searching")
        }
    }
    
    var filterednames: [String] {
        if searchtext.isEmpty {
            return allNames
        } else {
            return allNames.filter { $0.localizedCaseInsensitiveContains(searchtext) }
        }
    }
}

struct SearchableView_Previews: PreviewProvider {
    static var previews: some View {
        SearchableView()
    }
}
