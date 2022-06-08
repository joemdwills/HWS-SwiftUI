//
//  TapGestures.swift
//  Flashzilla
//
//  Created by Joe on 08/06/2022.
//

import SwiftUI

struct TapGestures: View {
    
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0
    @State private var currentAngle = Angle.zero
    @State private var finalAngle = Angle.zero
    
    var body: some View {
        Text("Magnification Gesture")
            .padding()
            .scaleEffect(finalAmount + currentAmount)
            .gesture(
                MagnificationGesture()
                    .onChanged { amount in
                        currentAmount = amount - 1
                    }
                    .onEnded { amount in
                        finalAmount += currentAmount
                        currentAmount = 0
                    }
            )
        
        Text("Rotation Gesture")
            .padding()
            .rotationEffect(finalAngle + currentAngle)
            .gesture(
                RotationGesture()
                    .onChanged { angle in
                        currentAngle = angle
                    }
                    .onEnded { angle in
                        finalAngle += currentAngle
                        currentAngle = .zero
                    }
            )
        
        Text("Long Press")
            .padding()
            .onLongPressGesture(minimumDuration: 1) {
                print("Long pressed!")
            } onPressingChanged: { inProgress in
                print("In progress: \(inProgress)")
            }
    }
}

struct TapGestures_Previews: PreviewProvider {
    static var previews: some View {
        TapGestures()
    }
}
