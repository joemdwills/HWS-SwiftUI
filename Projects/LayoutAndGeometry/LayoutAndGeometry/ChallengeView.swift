//
//  ChallengeView.swift
//  LayoutAndGeometry
//
//  Created by Joe on 15/06/2022.
//

import SwiftUI

struct ChallengeView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(Color(hue: min(1.0, geo.frame(in: .global).minY / fullView.size.height), saturation: 1.0, brightness: 1.0))
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            .opacity(geo.frame(in: .global).minY / 300)
                            .scaleEffect(max(0.5, geo.frame(in: .global).minY / 400))
                    }
                    .frame(height: 40)
//                    .scaleEffect(fullView.frame(in: .global).minY / 100)
                }
            }
        }
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}
