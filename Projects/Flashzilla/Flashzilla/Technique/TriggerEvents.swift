//
//  TriggerEvents.swift
//  Flashzilla
//
//  Created by Joe on 09/06/2022.
//

import SwiftUI

struct TriggerEvents: View {
    // To disable the timer you have to go to the upstream publisher event and cancel it.
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onReceive(timer) { time in
                print("The time is now \(time)")
            }
    }
}

struct TriggerEvents_Previews: PreviewProvider {
    static var previews: some View {
        TriggerEvents()
    }
}
