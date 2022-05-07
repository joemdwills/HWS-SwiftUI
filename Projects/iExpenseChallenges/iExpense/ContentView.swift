//
//  ContentView.swift
//  iExpense
//
//  Created by Joe Williams on 16/02/2022.
//

import SwiftUI



struct ContentView: View {
    @Environment(\.locale.currencyCode) var currencyCode
    @StateObject var expenses = Expenses()
    var personal: [ExpenseItem] {
        var items = [ExpenseItem]()
        for item in expenses.items {
            if item.type == "Personal" {
                items.append(item)
            } else {
                continue
            }
        }
        return items
    }
    var business: [ExpenseItem] {
        var items = [ExpenseItem]()
        for item in expenses.items {
            if item.type == "Business" {
                items.append(item)
            } else {
                continue
            }
        }
        return items
    }
    @State private var showingAddExpense = false
    
    @State private var expenseColour = Color.green
    
    var body: some View {
        NavigationView {
            List {
                Section("Personal") {
                    ForEach(personal) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                            }
                            Spacer()
                            Text(item.amount, format: .currency(code: currencyCode!))
                                .foregroundColor(checkExpense(amount: item.amount))
                        }
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel("\(item.name), \(currencyCode ?? "USD") \(item.amount)")
                        .accessibilityHint("Personal Expense")
                    }
                    .onDelete(perform: removeItems)
                }
                
                Section("Business") {
                    ForEach(business) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                            }
                            Spacer()
                            Text(item.amount, format: .currency(code: currencyCode!))
                                .foregroundColor(checkExpense(amount: item.amount))
                        }
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel("\(item.name), \(currencyCode ?? "USD") \(item.amount)")
                        .accessibilityHint("Business Expense")
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }

        }
    }
    
    func checkExpense(amount: Double) -> Color {
        if amount < 10 {
            return .green
        } else if amount < 100 {
            return .orange
        } else {
            return .red
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
