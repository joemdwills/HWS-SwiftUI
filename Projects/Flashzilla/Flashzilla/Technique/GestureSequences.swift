//
//  EmbeddedGestures.swift
//  Flashzilla
//
//  Created by Joe on 08/06/2022.
//

import SwiftUI

struct GestureSequences: View {
    // Gesture Sequences
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }
        
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
            }
        
        let combined = pressGesture.sequenced(before: dragGesture)
        
        VStack {
            Text("Hello World!")
                .onTapGesture {
                    print("Text tapped")
                }
            
            Circle()
                .fill(.red)
                .frame(width: 64, height: 64)
                .scaleEffect(isDragging ? 1.5 : 1)
                .offset(offset)
                .gesture(combined)
        }
        // .simultaneousGesture --> for both print statements to appear at the same time
        .highPriorityGesture(
            TapGesture()
                .onEnded{
                    print("VStack tapped")
                }
        )
        
        
        
    }
}

struct GestureSequences_Previews: PreviewProvider {
    static var previews: some View {
        GestureSequences()
    }
}
