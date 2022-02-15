//
//  ContentView.swift
//  Edutainment
//
//  Created by Joe Williams on 14/02/2022.
//

import SwiftUI

//@State private var askSettings = false

//struct SettingsView: View {
//    var body: some View {
//
//    }
//}

struct Question: View {
    var body: some View {
        VStack {
            Spacer()
            Text("")
            Spacer()
            TextField
        }
    }
}

struct ContentView: View {
    // State of app
    @State private var askSettings = true
    
    // Settings
    @State private var timestableNumber = 2
    @State private var questionAmount = 5
    @State private var answer = ""
    

    var body: some View {
        NavigationView {
            VStack {
    //            Section {
                    Stepper("\(timestableNumber)", value: $timestableNumber, in: 2...13, step: 1)
    //            } header: {
    //                Text("Number to practice")
    //            }
                
    //            Section("Pick the number of questions") {
                Stepper("\(questionAmount)", value: $questionAmount, in: 5...20, step: 5)
    //            }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
