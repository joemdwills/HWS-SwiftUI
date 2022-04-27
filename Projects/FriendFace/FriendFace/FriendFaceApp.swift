//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Joe on 23/04/2022.
//

import SwiftUI

@main
struct FriendFaceApp: App {
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            UsersView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
