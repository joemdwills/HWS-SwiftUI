//
//  ContentView.swift
//  Animations
//
//  Created by Joe Williams on 13/02/2022.
//

import SwiftUI

struct OverviewContent: View {
    
    @State private var animationAmount = 1.0
    @State private var rotationAmount = 0.0
    @State private var viewToShow = Views.growingButton
    
    enum Views: String, CaseIterable {
        case growingButton = "Growing Button"
        case growingButtonEaseOut = "GB EaseOut"
        case animateBindings = "Animate Bindings"
        case explicitAnimation = "Explicit Animation"
    }
    
    var growingButton: some View {
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            .blur(radius: (animationAmount - 1) * 3)
            .animation(.default, value: animationAmount) //implicit animation
    }
    
    var gbEaseOut: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(
            .easeInOut(duration: 1)
                .repeatForever(autoreverses: true),
            value: animationAmount
        ) //implicit animations always have to watch a specific value
    }
    
    var pulseEffect: some View {
            Button("Tap Me") {
//                animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                        .stroke(.red)
                        .scaleEffect(animationAmount)
                        .opacity(2 - animationAmount)
                        .animation(
                            .easeInOut(duration: 1)
                                .repeatForever(autoreverses: false),
                        value: animationAmount
                        ) //implicit animations always have to watch a specific value
                    )
            .onAppear {
                animationAmount = 2
            }
    }
    
    var animateBindings: some View {
        print(animationAmount)
        
        return VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
            ), in: 1...10)

            Spacer()
            
            Button("Tap me") {
                animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
    
    var explicitAnimation: some View {
        Button("Tap Me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                rotationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(rotationAmount), axis: (x: 1, y: 1, z: 0))
        
    }
    
    var body: some View {
        VStack {
            Picker("View to show", selection: $viewToShow) {
                ForEach(Views.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.wheel)
            
            Spacer()
            
            switch viewToShow {
            case .growingButton:
                growingButton
            case .growingButtonEaseOut:
                gbEaseOut
            case .animateBindings:
                animateBindings
            case .explicitAnimation:
                explicitAnimation
            }
            Spacer()
        }
        .padding()
    }
}

struct OverviewContent_Previews: PreviewProvider {
    static var previews: some View {
        OverviewContent()
    }
}
