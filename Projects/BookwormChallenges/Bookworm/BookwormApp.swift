//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Joe on 05/04/2022.
//

import SwiftUI

@main
struct BookwormApp: App {
    @State private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
