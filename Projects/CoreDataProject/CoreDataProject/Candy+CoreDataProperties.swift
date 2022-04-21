//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Joe on 21/04/2022.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?
    
    public var wrappedName: String {
        name ?? "unknown"
    }

}

extension Candy : Identifiable {

}
