//
//  ManualObservaleObjectView.swift
//  HotProspects
//
//  Created by Joe on 12/05/2022.
//

import SwiftUI

@MainActor class DelayedActor: ObservableObject {
    // here we've removed the @Published property wrapper but added the property observer with the method
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct ManualObservaleObjectView: View {
    @StateObject private var updater = DelayedActor()
                
    var body: some View {
        Text("Value is: \(updater.value)")
    }
}

struct ManualObservaleObjectView_Previews: PreviewProvider {
    static var previews: some View {
        ManualObservaleObjectView()
    }
}
