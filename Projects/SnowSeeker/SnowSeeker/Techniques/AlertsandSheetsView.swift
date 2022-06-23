//
//  AlertsandSheetsView.swift
//  SnowSeeker
//
//  Created by Joe on 19/06/2022.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct AlertsandSheetsView: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingUser = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("Tap this sheet")
                .onTapGesture {
                    selectedUser = User()
                }
                .sheet(item: $selectedUser) { user in
                    // this sets the user back to nil when the sheet is dismissed
                    Text(user.id)
                }
            
            Spacer()
            
            Text("Tap this alert")
                .onTapGesture {
                    selectedUser = User()
                    isShowingUser = true
                }
                .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
                    Button(user.id) { }
                }
            
            Spacer()
            
            Text("Tap this trivial alert")
                .onTapGesture {
                    selectedUser = User()
                    isShowingUser = true
                }
                .alert("Welcome", isPresented: $isShowingUser) { }
            
            Spacer()
        }
    }
}

struct AlertsandSheetsView_Previews: PreviewProvider {
    static var previews: some View {
        AlertsandSheetsView()
    }
}
