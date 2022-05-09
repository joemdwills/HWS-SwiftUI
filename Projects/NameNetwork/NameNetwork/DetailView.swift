//
//  DetailView.swift
//  NameNetwork
//
//  Created by Joe on 07/05/2022.
//

import MapKit
import SwiftUI

struct DetailView: View {
    var person: Person
    @State private var mapRegion: MKCoordinateRegion
    let emptyAvatar = UIImage(systemName: "person.fill")
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                ZStack() {
                    Image(uiImage: (UIImage(data: person.image) ?? emptyAvatar)!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 350, height: 400)
                        .clipShape(Circle())
                        .padding()
                        .shadow(color: .black.opacity(0.05), radius: 0.5, x: 0, y: 20)
                    
                    Text(person.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                        .background(.mint)
                        .clipShape(Capsule())
                        .offset(x: -100, y: -150)
                }
                
                HStack {
                    Text("Where you met...")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                    Spacer()
                }
                
                Map(coordinateRegion: $mapRegion)
                    .padding()
                    .frame(width: 400, height: 400, alignment: .center)
            }
        }
    }
    
    init(person: Person) {
        self.person = person
        _mapRegion = State(initialValue: MKCoordinateRegion(center: person.coordinate, span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25)))
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(person: Person.example)
    }
}
