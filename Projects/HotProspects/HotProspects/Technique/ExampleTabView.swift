//
//  TabView.swift
//  HotProspects
//
//  Created by Joe on 11/05/2022.
//

import SwiftUI

struct ExampleTabView: View {
    @State private var selectedTab = "One"
    
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Tab 1")
                .onTapGesture {
                    selectedTab = "Two"
                    print(selectedTab)
                }
                .tabItem {
                    Label("One", systemImage: "star")
                }
                .tag("One")
            
            Text("Tab 2")
                .onTapGesture {
                    selectedTab = "One"
                    print(selectedTab)
                }
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
                .tag("Two")
        }
    }
}

struct ExampleTabView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleTabView()
    }
}
