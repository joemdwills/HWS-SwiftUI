//
//  Person.swift
//  NameNetwork
//
//  Created by Joe on 07/05/2022.
//

import Foundation
import SwiftUI

struct Person: Comparable, Hashable, Identifiable, Codable {
    
    let id: UUID
    let name: String
    let image: Data
    
    static let exampleImage = UIImage(named: "Joseph")
    static let exampleImageData = exampleImage!.jpegData(compressionQuality: 0.8)
    static let example = Person(id: UUID(), name: "Joseph", image: exampleImageData ?? Data())
    
    static func < (lhs: Person, rhs: Person) -> Bool {
        lhs.name < rhs.name
    }
}
