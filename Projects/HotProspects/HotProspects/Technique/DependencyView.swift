//
//  DependencyView.swift
//  HotProspects
//
//  Created by Joe on 12/05/2022.
//

import SamplePackage
import SwiftUI

struct DependencyView: View {
    let possibleNumber = Array(1...60)
    
    var body: some View {
        Text(results)
    }
    
    var results: String {
        let selected = possibleNumber.random(9).sorted()
        let strings = selected.map(String.init)
        return strings.joined(separator: ", ")
    }
}

struct DependencyView_Previews: PreviewProvider {
    static var previews: some View {
        DependencyView()
    }
}
