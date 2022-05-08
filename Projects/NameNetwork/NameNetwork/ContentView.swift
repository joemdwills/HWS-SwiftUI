//
//  ContentView.swift
//  NameNetwork
//
//  Created by Joe on 07/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(viewModel.network, id: \.self) { person in
                        HStack {
                            Image(uiImage: (UIImage(data: person.image) ?? viewModel.emptyAvatar)!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            
                            Text(person.name)
                        }
                    }
                }
                
                VStack(alignment: .center) {
                    Spacer()
                    
                    Button {
                        viewModel.isShowingImagePicker = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(.red.opacity(0.75))
                    .foregroundColor(.white)
                    .frame(width: 44, height: 44)
                    .font(.title)
                    .clipShape(Circle())
                    .padding()
                }
            }
            .navigationTitle("NameNetwork")
            .fullScreenCover(isPresented: $viewModel.isShowingImagePicker, onDismiss: {
                viewModel.showNameAlert = true
            }, content: {
                ImagePicker(image: $viewModel.selectedImage)
            })
            .alert("What is their name?", isPresented: $viewModel.showNameAlert) {
                TextField("Name", text: $viewModel.name)
                Button("Save") {
                    viewModel.addPerson()
                }
                Button("Cancel", role: .cancel) {
//                    selectedImage = UIImage()
                }
            }
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
