//
//  Person.swift
//  NameNetwork
//
//  Created by Joe on 07/05/2022.
//
import CoreLocation
import Foundation
import SwiftUI

struct Person: Comparable, Identifiable, Codable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: UUID
    let name: String
    let image: Data
    var latitude: Double = 37.3346
    var longitude: Double = 122.0090
    
    var coordinate: CLLocationCoordinate2D { CLLocationCoordinate2D(latitude: latitude, longitude: longitude) }
    
    static let exampleImage = UIImage(named: "Joseph")
    static let exampleImageData = exampleImage!.jpegData(compressionQuality: 0.8)
    static let example = Person(id: UUID(), name: "Joseph", image: exampleImageData ?? Data(), latitude: 51.5033, longitude: 0.1196)
    
    static func < (lhs: Person, rhs: Person) -> Bool {
        lhs.name < rhs.name
    }
}
