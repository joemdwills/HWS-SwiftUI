//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Joe Williams on 01/02/2022.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

// A Custom modifier
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(.red)
            .clipShape(Capsule())
    }
}

struct OverviewContent: View {
    @State private var viewToShow = Views.ternaryOperator
    
    
    enum Views: String, CaseIterable {
        case ternaryOperator = "TernaryOperator"
        case envinromentMods = "EnviromentMods"
        case capsuleText = "CapsuleText"
        case customMod = "CustomMod"
        case gridStack = "GridStack"
    }
    
    @State private var useRedText = false
    var ternaryOperator: some View {
        Button("Hello World!") {
            useRedText.toggle()
        }
        .foregroundColor(useRedText ? .red : .blue)
    }
    
    var environmentModifier: some View {
        VStack {
            Text("Gryffindor")
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .font(.title) // This is the <- Environment Modifier
    }
    
    var capsuleText: some View {
        VStack {
            CapsuleText(text: "First")
            CapsuleText(text: "Second")
        }
    }
    
    var customModifier: some View {
        Text("Enormous Hello")
            .titleStyle()
    }
    
    var gridStack: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            HStack {
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
            }
        }
    }
    
    var body: some View {
        VStack {
            Picker("View to Show", selection: $viewToShow) {
                ForEach(Views.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.wheel)
            Spacer()
            switch viewToShow {
            case .ternaryOperator:
                ternaryOperator
            case .envinromentMods:
                environmentModifier
            case .capsuleText:
                capsuleText
            case .customMod:
                customModifier
            case .gridStack:
                gridStack
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
