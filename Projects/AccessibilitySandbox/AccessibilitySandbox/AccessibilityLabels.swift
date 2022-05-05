//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Joe on 04/05/2022.
//

import SwiftUI

struct AccessibilityLabels: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    let labels = [
        "Tulips",
        "Frozen Tree Buds",
        "Sunflowers",
        "Fireworks"
    ]
    
    @State private var selectedPicture = Int.random(in: 0...3)
    
    var body: some View {
        Image(pictures[selectedPicture])
            .resizable()
            .scaledToFit()
            .onTapGesture {
                selectedPicture = Int.random(in: 0...3)
            }
            .accessibilityLabel(labels[selectedPicture])
            .accessibilityAddTraits(.isButton)
    }
}

struct AccessibilityLabels_Previews: PreviewProvider {
    static var previews: some View {
        AccessibilityLabels()
    }
}
