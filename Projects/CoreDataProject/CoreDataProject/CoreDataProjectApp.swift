//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Joe on 16/04/2022.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @State private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            CountryView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
