//
//  ContentView.swift
//  Moonshot
//
//  Created by Joe Williams on 19/02/2022.
//

import SwiftUI

struct User: Codable {
    var name: String
    var address: Address
}

struct Address: Codable {
    var street: String
    var city: String
}

struct OverviewContent: View {
    @State private var viewsToShow = Views.resizedImage
    
    let layout = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var resizedImage: some View {
        GeometryReader { geo in
            Image("Example")
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width * 0.8)
                .frame(width: geo.size.width, height: geo.size.height) // TIP: this centers the view inside the frame, because it matches the device safe area dimensions.
        }
    }
    
    var scrollView: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(0..<100) {
                    Text("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    var navigationLink: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink {
                    Text("Detail \(row)")
                } label: {
                    Text("Row \(row)")
                        .padding()
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
    
    var decodedView: some View {
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """
            let data = Data(input.utf8)
            
            if let user = try? JSONDecoder().decode(User.self, from: data) {
                print(user.address.street)
            }
        }
    }
    
    var layoutView: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<201) {
                    Text("Item \($0)")
                }
            }
        }
    }
    
    enum Views: String, CaseIterable {
        case resizedImage = "Resized Image"
        case scrollView = "Scroll View"
        case navLink = "Multiple Views"
        case decodeView = "Decoding JSON"
        case layoutView = "Grid View"
    }
    
    var body: some View {
        Picker("Views", selection: $viewsToShow) {
            ForEach(Views.allCases, id: \.self) {
                Text($0.rawValue)
            }
        }
        .pickerStyle(.wheel)
        Spacer()
        switch viewsToShow {
        case .resizedImage:
            resizedImage
        case .scrollView:
            scrollView
        case .navLink:
            navigationLink
        case .decodeView:
            decodedView
        case .layoutView:
            layoutView
        }
        Spacer()
    }
}

struct OverviewContent_Previews: PreviewProvider {
    static var previews: some View {
        OverviewContent()
    }
}
