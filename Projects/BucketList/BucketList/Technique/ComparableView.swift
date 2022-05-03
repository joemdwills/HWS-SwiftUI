//
//  ComparableView.swift
//  BucketList
//
//  Created by Joe on 02/05/2022.
//

import SwiftUI

struct User: Comparable, Identifiable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ComparableView: View {
    let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Kristine", lastName: "Kochanski"),
        User(firstName: "David", lastName: "Lister")
    ].sorted()
    
    var body: some View {
        List(users) { user in
            Text("\(user.firstName) \(user.lastName)")
        }
    }
}

struct ComparableView_Previews: PreviewProvider {
    static var previews: some View {
        ComparableView()
    }
}
