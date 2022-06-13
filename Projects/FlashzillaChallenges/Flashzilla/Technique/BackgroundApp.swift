//
//  BackgroundApp.swift
//  Flashzilla
//
//  Created by Joe on 09/06/2022.
//

import SwiftUI

struct BackgroundApp: View {
    @Environment(\.scenePhase) var scenePhase
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding()
            .onChange(of: scenePhase) { newPhase in
                if newPhase == .active {
                    print("Active")
                } else if newPhase == .inactive {
                    print("Inactive")
                } else if newPhase == .background {
                    print("Background")
                }
            }
    }
}

struct BackgroundApp_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundApp()
    }
}
