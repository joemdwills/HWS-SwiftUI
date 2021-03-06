//
//  ContentViewModel.swift
//  NameNetwork
//
//  Created by Joe on 07/05/2022.
//

import Foundation
import SwiftUI

@MainActor class ContentViewModel: ObservableObject {
    @Published var network: [Person]
    
    @Published var selectedImage: UIImage?
    @Published var selectedName = "Unassigned Name"
    
    @Published var isShowingImagePicker = false
    @Published var showNameAlert = false
    
    @Published var locationApproved = false
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedNetwork")
    let emptyAvatar = UIImage(systemName: "person.fill")
    let locationFetcher = LocationFetcher()
    
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            network = try JSONDecoder().decode([Person].self, from: data).sorted()
        } catch {
            network = []
        }
    }
    
    func addPerson() {
        guard let selectedImage = selectedImage else { return }
        
        if let jpegData = selectedImage.jpegData(compressionQuality: 0.8) {
            var newPerson = Person(id: UUID(), name: selectedName, image: jpegData)
            
            if locationApproved {
                if let location = self.locationFetcher.lastKnownLocation {
                    newPerson.latitude = location.latitude
                    newPerson.longitude = location.longitude
                }
            }
            
            network.append(newPerson)
            save()
            update()
        }
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(network)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }
    
    func update() {
        network = network.sorted()
    }
}
