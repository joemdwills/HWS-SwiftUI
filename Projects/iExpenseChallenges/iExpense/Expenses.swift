//
//  Expenses.swift
//  iExpense
//
//  Created by Joe Williams on 16/02/2022.
//

import Foundation
import UIKit

class Expenses: ObservableObject {
//    @Published var personalItems = [ExpenseItem]() {
//        didSet {
//            if let encoded = try? JSONEncoder().encode(personalItems) {
//                UserDefaults.standard.set(encoded, forKey: "personalItems")
//            }
//        }
//    }
//
//    @Published var businessItems = [ExpenseItem]() {
//        didSet {
//            if let encoded = try? JSONEncoder().encode(businessItems) {
//                UserDefaults.standard.set(encoded, forKey: "businessItems")
//            }
//        }
//    }
//
//    init() {
//        if let savedPersonalItems = UserDefaults.standard.data(forKey: "personalItems") {
//            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedPersonalItems) {
//                personalItems = decodedItems
//                return
//            }
//        }
//
//        if let savedBusinessItems = UserDefaults.standard.data(forKey: "businessItems") {
//            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedBusinessItems) {
//                businessItems = decodedItems
//                return
//            }
//        }
//        personalItems = []
//        businessItems = []
    
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
