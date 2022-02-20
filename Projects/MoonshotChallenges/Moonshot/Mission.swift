//
//  Mission.swift
//  Moonshot
//
//  Created by Joe Williams on 20/02/2022.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable { // Example of a nested struct, which means it will be simpler to call data.
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    //Computed properties
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
