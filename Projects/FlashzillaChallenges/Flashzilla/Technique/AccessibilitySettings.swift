//
//  AccessibilitySettings.swift
//  Flashzilla
//
//  Created by Joe on 09/06/2022.
//

import SwiftUI


func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

struct AccessibilitySettings: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @State private var scale = 1.0
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                if differentiateWithoutColor {
                    Image(systemName: "checkmark.circle")
                }
                
                Text("Success")
            }
            .padding()
            .background(differentiateWithoutColor ? .black : .green)
            .foregroundColor(.white)
            .clipShape(Capsule())
            Spacer()
            
            Text("Hello World!")
                .scaleEffect(scale)
                .onTapGesture {
                    withOptionalAnimation {
                        scale *= 1.5
                    }
                }
            Spacer()
            Text("Hello World!")
                .padding()
                .background(reduceTransparency ? .black : .black.opacity(0.5))
                .foregroundColor(.white)
                .clipShape(Capsule())
            Spacer()
        }
    }
}

struct AccessibilitySettings_Previews: PreviewProvider {
    static var previews: some View {
        AccessibilitySettings()
    }
}
