//
//  ContentView.swift
//  BetterRest
//
//  Created by Joe Williams on 02/02/2022.
//

import SwiftUI

struct OverviewContent: View {
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    var stepper: some View {
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
            .padding()
    }
    
    var datePicker: some View {
        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
            .labelsHidden()
            .padding()
    }
    
    var dates: some View {
        VStack {
            Text(Date.now, format: .dateTime.day().month().year().hour().minute())
            Text(Date.now.formatted(date: .long, time: .omitted))
        }
    }
    
    enum Views: String {
        case stepper = "Stepper"
        case datePicker = "Date Picker"
        case dates = "Date Components"
        case coreML = "Machine Learning"
    }

    
    var body: some View {
        dates
    }
    
    func exampleDate() {
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = Date.now...tomorrow
    }
    
    func trivialExample() {
        let components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
    }
}

struct OverviewContent_Previews: PreviewProvider {
    static var previews: some View {
        OverviewContent()
    }
}
