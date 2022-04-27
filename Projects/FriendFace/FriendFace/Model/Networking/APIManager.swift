//
//  APIManager.swift
//  FriendFace
//
//  Created by Joe on 23/04/2022.
//

import Foundation

class APIManager: ObservableObject {
    
    @Published var users = [User]()
    
    func fetchUsers() async {
        guard users.isEmpty else { return }
        
        do {
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            users = try decoder.decode([User].self, from: data)
        } catch {
            print("Invalid data")
        }
    }
}
