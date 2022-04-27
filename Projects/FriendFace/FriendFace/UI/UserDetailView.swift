//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Joe on 23/04/2022.
//

import SwiftUI

struct UserDetailView: View {

    let user: CachedUser
    
    var body: some View {
        List {
            Section {
                Text("Age: \(user.age)")
                Text("Email: \(user.wrappedEmail)")
                Text("Company: \(user.wrappedCompany)")
                HStack {
                    Circle()
                        .fill(user.isActive ? .green : .orange)
                        .frame(width: 10)
                    Text(user.isActive ? "Active" : "Away")
                }
            } header: {
                Text("Info")
            }
            
            Section {
                Text("Address: \(user.wrappedAddress)")
            } header: {
                Text("Contact Details")
            }
            
            Section {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach((user.wrappedTags.split(separator: ",") as! [String.SubSequence]), id: \.self) { tag in
                            Text(tag.uppercased())
                                .font(.caption)
                                .fontWeight(.black)
                                .padding(8)
                                .background(.gray.opacity(0.2))
                                .clipShape(Capsule())
                        }
                    }
                }
            } header: {
                Text("Tags")
            }
            .listRowBackground(Color.clear)
            
            Section {
                ForEach(user.friendsArray as [CachedFriend]) { friend in
                    Text(friend.wrappedName)
                }
            } header: {
                Text("Friends")
            }
        
        }
        .listStyle(.insetGrouped)
        .navigationTitle(user.wrappedName)
        .navigationBarTitleDisplayMode(.inline)
    }
}
//
//struct UserDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserDetailView(user: User.example)
//    }
//}
