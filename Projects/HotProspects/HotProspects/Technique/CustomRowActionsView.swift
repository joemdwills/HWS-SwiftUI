//
//  CustomRowActionsView.swift
//  HotProspects
//
//  Created by Joe on 12/05/2022.
//

import SwiftUI

struct CustomRowActionsView: View {
    
    var body: some View {
        List {
            Text("Taylor Swift")
                .swipeActions {
                    Button(role: .destructive) {
                        print("Deleting")
                    } label: {
                        Label("Delete", systemImage: "minus.circle")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button {
                        print("Pinning")
                    } label: {
                        Label("Pin", systemImage: "pin")
                    }
                    .tint(.orange)
                }
        }
    }
}

struct CustomRowActionsView_Previews: PreviewProvider {
    static var previews: some View {
        CustomRowActionsView()
    }
}
