//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Joe Williams on 30/01/2022.
//

import SwiftUI

struct OverviewContent: View {
    @State private var viewToShow = Views.stacks
    @State private var showingAlert = false
    
    
    enum Views: String, CaseIterable {
        case stacks = "Stacks"
        case gradients = "Gradients"
        case buttons = "Buttons"
        case alerts = "Alerts"
    }
    
    var stacks: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            Text("Your content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
    }
    
    var gradients: some View {
        RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
    }
    
    var buttons: some View {
        VStack {
            Button("Button 1") { }
                .buttonStyle(.bordered)
            Button("Button 2", role: .destructive) { }
                .buttonStyle(.bordered)
            Button("Button 3") { }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
            Button("Button 4", role: .destructive) { }
                .buttonStyle(.borderedProminent)
            Button {
                print("Button was tapped!")
            } label: {
                Label("Tap me", systemImage: "pencil")
                    .background(.orange)
            }
        }
    }
    
    var alerts: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        .alert("Important Message", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) { }
        } message: {
            Text("Please read this")
        }
    }
    
    var body: some View {
        VStack {
            Picker("View to Show", selection: $viewToShow) {
                ForEach(Views.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.segmented)
            Spacer()
            switch viewToShow {
            case .stacks:
                stacks
            case .gradients:
                gradients
            case .buttons:
                buttons
            case .alerts:
                alerts
            }
            Spacer()
        }
    }
}

struct OverviewContent_Previews: PreviewProvider {
    static var previews: some View {
        OverviewContent().preferredColorScheme(.light)
    }
}
