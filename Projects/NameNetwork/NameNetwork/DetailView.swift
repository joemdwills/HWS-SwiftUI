//
//  DetailView.swift
//  NameNetwork
//
//  Created by Joe on 07/05/2022.
//

import SwiftUI

struct DetailView: View {
    var person: Person
    
    let emptyAvatar = UIImage(systemName: "person.fill")
    
    var body: some View {
        NavigationView {
            VStack {
                Image(uiImage: (UIImage(data: person.image) ?? emptyAvatar)!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 400)
                    .clipShape(Circle())
                    .padding()
                    .shadow(color: .black.opacity(0.05), radius: 0.5, x: 0, y: 20)
                
                Spacer()
                
                Text(person.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .background(.mint.opacity(0.4))
                    .clipShape(Capsule())
                
                Spacer()
            }
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(person: Person.example)
    }
}
