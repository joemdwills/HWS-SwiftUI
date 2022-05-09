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
            ZStack(alignment: .bottom) {
                List {
                    ForEach(viewModel.network, id: \.id) { person in
                        NavigationLink {
                            DetailView(person: person)
                        } label: {
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
                }
                .listStyle(.inset)
//                .onAppear() {
//                    UITableView.appearance().backgroundColor = UIColor.white
//                }
                    
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.locationFetcher.start()
                        viewModel.locationApproved = true
                    } label: {
                        Image(systemName: "location.circle")
                    }
                }
            }
            .fullScreenCover(isPresented: $viewModel.isShowingImagePicker, onDismiss: {
                viewModel.showNameAlert = true
            }, content: {
                ImagePicker(image: $viewModel.selectedImage)
            })
            .alert(isPresented: $viewModel.showNameAlert, TextFieldAlert(title: "What is their name?", message: "Save a name so that you can remember them forever", action: { submittedText in
                if let text = submittedText {
                    viewModel.selectedName = text
                    viewModel.addPerson()
                }
            }))
        }
        .navigationViewStyle(.stack)
//            .alert("What is their name?", isPresented: $viewModel.showNameAlert) {
//                TextField("Name", text: $viewModel.name)
//                Button("Save") {
//                    viewModel.addPerson()
//                }
//                Button("Cancel", role: .cancel) {
//
//                }
//            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
