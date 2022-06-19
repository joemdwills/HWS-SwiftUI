//
//  TransparentLayerView.swift
//  SnowSeeker
//
//  Created by Joe on 19/06/2022.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Joe")
            Text("Country: England")
            Text("Sports: CrossFit")
        }
        .font(.title)
    }
}

struct TransparentLayerView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        Group {
            if sizeClass == .compact {
                VStack(content: UserView.init)
            } else {
                HStack(content: UserView.init)
            }
        }
    }
}

struct TransparentLayerView_Previews: PreviewProvider {
    static var previews: some View {
        TransparentLayerView()
    }
}
