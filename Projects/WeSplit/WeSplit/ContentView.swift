//
//  ContentView.swift
//  WeSplit
//
//  Created by Joe Williams on 16/01/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        Form {
            Section {
                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "GBP"))
                    .keyboardType(.decimalPad)
            }
            
            Section {
                Text(checkAmount, format: .currency(code: Locale.current.currencyCode ?? "GBP"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}