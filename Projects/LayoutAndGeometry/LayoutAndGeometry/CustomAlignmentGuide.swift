//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Joe on 13/06/2022.
//

import SwiftUI

extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct CustomAlignmentGuide: View {
    var body: some View {
        VStack {
            HStack(alignment: .lastTextBaseline) {
                Text("Live")
                    .font(.caption)
                Text("Long")
                Text("and")
                    .font(.title)
                Text("Propser")
                    .font(.largeTitle)
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Hello World!")
                    .alignmentGuide(.leading) { d in
                        d[.trailing]
                    }
                Text("This is a longer line of text")
            }
            .background(.red)
            .frame(width: 400, height: 200)
            .background(.blue)
            
            Spacer()
            
            HStack(alignment: .midAccountAndName) {
                VStack {
                    Text("@joemdwills")
                        .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                    // Places an alignment guide through the center of the @joemdwills view vertically
                    Image("Joseph")
                        .resizable()
                        .frame(width: 64, height: 64)
                }
                
                VStack {
                    Text("Full name:")
                    Text("Joseph Williams")
                        .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                        .font(.largeTitle)
                }
            }
        }
    }
}

struct CustomAlignmentGuide_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlignmentGuide()
    }
}
