//
//  GroupAccessibility.swift
//  AccessibilitySandbox
//
//  Created by Joe on 04/05/2022.
//

import SwiftUI

struct GroupAccessibility: View {
    var body: some View {
        VStack {
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Your score is 1000")
        
    }
}

struct GroupAccessibility_Previews: PreviewProvider {
    static var previews: some View {
        GroupAccessibility()
    }
}
