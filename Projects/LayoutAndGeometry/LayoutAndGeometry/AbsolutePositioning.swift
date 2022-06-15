//
//  AbsolutePositioning.swift
//  LayoutAndGeometry
//
//  Created by Joe on 15/06/2022.
//

import SwiftUI

struct AbsolutePositioning: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            // position modifiers take up all the available space to then place the view in the specified point.
                .background(.red)
                .position(x: 100, y: 100)
                .frame(width: 400, height: 200)
                .border(.blue)
            
            Spacer()
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            // offset changes the location the view is rendered not where the view frame is
                .background(.red)
                .offset(x: 50, y: 50)
                .background(.green)
            
            Spacer()
            
        }
    }
}

struct AbsolutePositioning_Previews: PreviewProvider {
    static var previews: some View {
        AbsolutePositioning()
    }
}
