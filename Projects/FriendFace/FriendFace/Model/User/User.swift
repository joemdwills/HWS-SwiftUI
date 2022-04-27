//
//  User.swift
//  FriendFace
//
//  Created by Joe on 23/04/2022.
//

import Foundation

struct User: Identifiable, Codable {
    
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
    
    static let example = User(id: UUID(), isActive: true, name: "Joe Williams", age: 28, company: "Dyson", email: "joe@appstrm.co.uk", address: "31 New Road, Chippenham, SN15 1HP", about: "Aspiring iOS Developer", registered: Date.now, tags: ["crossfit", "swift", "swiftui", "apple", "fitness", "technology", "sports"], friends: [])
}

//extension User {
//    enum CodingKeys: CodingKey {
//        case id
//        case isActive
//        case name
//        case age
//        case company
//        case email
//        case address
//        case about
//        case registered
//        case tags
//        case friends
//    }
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        
//        id = try container.decode(String.self, forKey: .id)
//        isActive = try container.decode(Bool.self, forKey: .isActive)
//        name = try container.decode(String.self, forKey: .name)
//        age = try container.decode(Int.self, forKey: .age)
//        company = try container.decode(String.self, forKey: .company)
//        email = try container.decode(String.self, forKey: .email)
//        address = try container.decode(String.self, forKey: .address)
//        about = try container.decode(String.self, forKey: .about)
//        registered = try container.decode(Date.self, forKey: .registered)
//        tags = try container.decode([Tag].self, forKey: .tags)
//        friends = try container.decode([Friend].self, forKey: .friends)
//    }
//}
