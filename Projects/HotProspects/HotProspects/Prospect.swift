//
//  Prospect.swift
//  HotProspects
//
//  Created by Joe on 21/05/2022.
//

import Foundation

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var email = ""
    fileprivate(set) var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published var people: [Prospect]
    
    init() {
        people = []
    }
    
    func toggle(prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
    }
}
