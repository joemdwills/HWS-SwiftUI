//
//  ContentView.swift
//  Animations
//
//  Created by Joe Williams on 13/02/2022.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct ContentView: View {
    let letters = Array("Hello, SwiftUI")
    
    @State private var dragAmount = CGSize.zero
    @State private var enabled = false
    @State private var isShowingRed = false
    
    // Views to show
    @State private var viewsToShow = Views.cardDrag
    
    enum Views: String, CaseIterable {
        case cardDrag = "Drag Card"
        case snakeText = "Snake Text"
        case simpleTransition = "Simple Transition"
        case customTransition = "Custom Transition"
    }
    
    var cardDrag: some View {
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        withAnimation {
                            dragAmount = .zero
                        }
                    }
            )
    }
    
    var snakeText: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(
                        .default.delay(Double(num) / 20),
                        value: dragAmount
                    )
                
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
    }
    
    var simpleTransition: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.scale)
            }
        }
    }
    
    var customTransition: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
    
    var body: some View {
        VStack {
            Picker("Views to show", selection: $viewsToShow) {
                ForEach(Views.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.wheel)
            
            Spacer()
            
            switch viewsToShow {
            case .cardDrag:
                cardDrag
            case .snakeText:
                snakeText
            case .simpleTransition:
                simpleTransition
            case .customTransition:
                customTransition
            }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
