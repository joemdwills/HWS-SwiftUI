//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Joe on 16/04/2022.
//

import SwiftUI

struct Student: Hashable {
    let name: String
}

struct MergePolicyView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    
    var body: some View {
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }
            
            Button("Add") {
                let wizard = Wizard(context: moc)
                wizard.name = "Harry Potter"
            }
            
            Button("Save") {
                do {
                    try moc.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct MergePolicyView_Previews: PreviewProvider {
    static var previews: some View {
        MergePolicyView()
    }
}
