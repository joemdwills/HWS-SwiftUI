//
//  ContentView.swift
//  Drawing
//
//  Created by Joe Williams on 26/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = 0.0
    
    var blendMode: some View {
        ZStack{
            Image("Example")
                .colorMultiply(.red)
        }
    }
    
    var blendMode2: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(.red)
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(.green)
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(.blue)
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
    
    var body: some View {
        blendMode2
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
