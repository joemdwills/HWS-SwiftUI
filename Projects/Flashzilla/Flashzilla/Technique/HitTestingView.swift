//
//  HitTestingView.swift
//  Flashzilla
//
//  Created by Joe on 08/06/2022.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        VStack {
            Text("Hello")
            Spacer()
            Text("World")
        }
//        .contentShape(Rectangle()) To tap the include the Spacer in the tappable zone.
        .onTapGesture {
            print("VStack tapped!")
        }
    }
}

struct HitTestingView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Rectangle tapped!")
                }
            
            Circle()
                .fill(.red)
                .frame(width: 300, height: 300)
                .contentShape(Rectangle())
                .onTapGesture {
                    print("Circle tapped!")
                }
//                .allowsHitTesting(false)
        }
    }
}

struct HitTestingView_Previews: PreviewProvider {
    static var previews: some View {
        HitTestingView()
    }
}
