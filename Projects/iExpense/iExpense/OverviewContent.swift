//
//  ContentView.swift
//  iExpense
//
//  Created by Joe Williams on 15/02/2022.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct ObjectView: View {
    @StateObject var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}

struct FirstView: View {
    @State private var showSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            // show the sheet
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet) {
            SecondView(name: "joemdwills")
        }

    }
}

struct SecondView: View {
    var name: String
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text("Hello, \(name)")
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct ListView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                Button("Add Numbers") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .navigationTitle("onDelete()")
            .toolbar {
                EditButton()
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct DefaultsView: View {
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
        }
    }
}

struct User2: Codable {
    let firsName: String
    let lastName: String
}

struct ArchivingView: View {
    @State private var user = User2(firsName: "Taylor", lastName: "Swift")
    
    var body: some View {
        
        
        Button("Save User") {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct OverviewContent: View {
    @State private var viewsToShow = Views.list
    
    enum Views: String, CaseIterable {
        case stateObject = "Observable Object"
        case secondView = "Dismissable View"
        case list = "Deletable Lists"
        case tap = "App Storage"
        case json = "JSON Encoder"
    }
    
    var body: some View {
        VStack {
            Picker("Views", selection: $viewsToShow) {
                ForEach(Views.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.wheel)
            Spacer()
            switch viewsToShow {
            case .stateObject:
                ObjectView()
            case .secondView:
                FirstView()
            case .list:
                ListView()
            case .tap:
                DefaultsView()
            case .json:
                ArchivingView()
            }
            Spacer()
        }
    }
}

struct OverviewContent_Previews: PreviewProvider {
    static var previews: some View {
        OverviewContent()
    }
}
