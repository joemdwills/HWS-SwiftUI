//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Joe on 20/04/2022.
//

import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) { item in
            self.content(item)
        }
    }
    
    init(sortDescriptors: [SortDescriptor<T>]?, filterKey: String, filterValue: String, predicate: Predicate, @ViewBuilder content: @escaping (T) -> Content) {

        _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptors ?? [], predicate: NSPredicate(format: "%K \(predicate.rawValue) %@", filterKey, filterValue))
        self.content = content
    }
}
