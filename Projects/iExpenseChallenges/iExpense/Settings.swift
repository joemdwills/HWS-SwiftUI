//
//  Settings.swift
//  iExpense
//
//  Created by Joe Williams on 16/02/2022.
//

import Foundation
import SwiftUI

class System: ObservableObject {
    @StateObject var currencyCode = Locale.current
}
